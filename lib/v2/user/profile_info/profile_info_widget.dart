import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/v2/user/descripcion_profesional/descripcion_profesional_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_info_model.dart';
export 'profile_info_model.dart';

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({
    super.key,
    required this.professional,
  });

  final DocumentReference? professional;

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  late ProfileInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileInfoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget!.professional?.id,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersRecord> profileInfoUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final profileInfoUsersRecord = profileInfoUsersRecordList.isNotEmpty
            ? profileInfoUsersRecordList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color(0xFF4963C9),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'u3pklca0' /* Profile */,
                ),
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'pintanga',
                      color: Colors.white,
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
              actions: [
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    key: ValueKey('share'),
                    borderRadius: 24.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.share_rounded,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      _model.currentPageLink = await generateCurrentPageLink(
                        context,
                        title: 'Meet This Professional: A True Standout!',
                        imageUrl: profileInfoUsersRecord?.photoUrl != null &&
                                profileInfoUsersRecord?.photoUrl != ''
                            ? profileInfoUsersRecord?.photoUrl
                            : 'https://i.ibb.co/2qkDLKb/Frame-74.png',
                        description:
                            'Discover a professional who makes a difference.',
                      );

                      await Share.share(
                        _model.currentPageLink,
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if ((currentUserDocument?.favorites?.toList() ?? [])
                                  .contains(widget!.professional) ==
                              true)
                            AuthUserStreamWidget(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.chatRef = await queryChatsRecordOnce(
                                    queryBuilder: (chatsRecord) =>
                                        chatsRecord.where(
                                      'users',
                                      arrayContains: currentUserReference,
                                    ),
                                  );

                                  context.pushNamed(
                                    'chat_2_Details',
                                    queryParameters: {
                                      'chatRef': serializeParam(
                                        _model.chatRef
                                            ?.where((e) =>
                                                (e.users.contains(
                                                        widget!.professional) ==
                                                    true) &&
                                                e.users.contains(
                                                    currentUserReference))
                                            .toList()
                                            ?.first,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatRef': _model.chatRef
                                          ?.where((e) =>
                                              (e.users.contains(
                                                      widget!.professional) ==
                                                  true) &&
                                              e.users.contains(
                                                  currentUserReference))
                                          .toList()
                                          ?.first,
                                    },
                                  );

                                  safeSetState(() {});
                                },
                                child: Icon(
                                  key: ValueKey('message'),
                                  FFIcons.kmessage,
                                  color: Colors.white,
                                  size: 33.0,
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 6.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.addFavoritesModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AddFavoritesWidget(
                                  key: ValueKey('favorite'),
                                  professional: profileInfoUsersRecord!,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xB74963C9),
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        profileInfoUsersRecord?.photoUrl,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/italentmind-fog8iw/assets/stx0cdmjoua0/italentLogo.png',
                                      ),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(22.0),
                                          bottomRight: Radius.circular(22.0),
                                          topLeft: Radius.circular(22.0),
                                          topRight: Radius.circular(22.0),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(32.0),
                                          bottomRight: Radius.circular(32.0),
                                          topLeft: Radius.circular(32.0),
                                          topRight: Radius.circular(32.0),
                                        ),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 500),
                                          fadeOutDuration:
                                              Duration(milliseconds: 500),
                                          imageUrl: valueOrDefault<String>(
                                            profileInfoUsersRecord?.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/italentmind-fog8iw/assets/stx0cdmjoua0/italentLogo.png',
                                          ),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.5, 0.0),
                                    child: Container(
                                      width: 170.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 4.0),
                                            child: Container(
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                functions.upperCaseFirstLetter(
                                                    valueOrDefault<String>(
                                                  functions.concatStrings(
                                                      profileInfoUsersRecord
                                                          ?.firtsName,
                                                      profileInfoUsersRecord
                                                          ?.lastName,
                                                      ' '),
                                                  'last name',
                                                )),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'pintanga',
                                                          color: Colors.white,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              width: 161.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                functions.changeServiceLanguge(
                                                    valueOrDefault<String>(
                                                      profileInfoUsersRecord
                                                          ?.serviceType?.first,
                                                      'telfer psychologist',
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .languageCode),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'pintanga',
                                                          color: Colors.white,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Container(
                                              width: 161.0,
                                              height: 19.0,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                functions.changeAge(
                                                    profileInfoUsersRecord!.age,
                                                    FFLocalizations.of(context)
                                                        .languageCode),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'pintanga',
                                                          color: Colors.white,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 5.0))
                                            .addToStart(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.3),
                                    child: wrapWithModel(
                                      model: _model.membresiaLogoModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: MembresiaLogoWidget(
                                        width: 70,
                                        heigth: 70,
                                        professional: widget!.professional!,
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      wrapWithModel(
                        model: _model.descripcionProfesionalModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DescripcionProfesionalWidget(
                          parameter1: profileInfoUsersRecord?.description,
                          parameter2:
                              FFLocalizations.of(context).languageCode == 'en'
                                  ? valueOrDefault<String>(
                                      formatNumber(
                                        profileInfoUsersRecord?.years,
                                        formatType: FormatType.custom,
                                        format: '> # years',
                                        locale: '',
                                      ),
                                      '> # years',
                                    )
                                  : valueOrDefault<String>(
                                      formatNumber(
                                        profileInfoUsersRecord?.years,
                                        formatType: FormatType.custom,
                                        format: '> # años',
                                        locale: '',
                                      ),
                                      '> # años',
                                    ),
                          video: valueOrDefault<String>(
                            profileInfoUsersRecord?.video,
                            'https://assets.mixkit.co/videos/51585/51585-720.mp4',
                          ),
                          services: profileInfoUsersRecord!.serviceType,
                          imgs: profileInfoUsersRecord!.images,
                          company: (profileInfoUsersRecord?.business != null) ||
                                  (profileInfoUsersRecord?.rol ==
                                      Roles.business)
                              ? profileInfoUsersRecord?.comapny
                              : 'default230',
                          schedule: profileInfoUsersRecord?.schedule,
                        ),
                      ),
                    ].addToEnd(SizedBox(height: 32.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
