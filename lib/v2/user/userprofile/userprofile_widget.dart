import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/user/account_option/account_option_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'userprofile_model.dart';
export 'userprofile_model.dart';

class UserprofileWidget extends StatefulWidget {
  const UserprofileWidget({super.key});

  @override
  State<UserprofileWidget> createState() => _UserprofileWidgetState();
}

class _UserprofileWidgetState extends State<UserprofileWidget> {
  late UserprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserprofileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: const BoxDecoration(
                            color: Color(0x31FB8CE2),
                          ),
                          child: Stack(
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://i.ibb.co/2qkDLKb/Frame-74.png',
                                    ),
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: const BoxDecoration(
                                  color: Color(0x59F428EB),
                                ),
                                child: const Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                functions.upperCaseFirstLetter(valueOrDefault(
                                    currentUserDocument?.firtsName, '')),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 28.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        if (currentUserPhoto == '')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 150.0,
                                decoration: const BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Profilesettings');
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_41.png',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (currentUserDocument?.rol != Roles.user)
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 326.0,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (currentUserDocument?.plan ==
                                        Plan.basic) {
                                      context.pushNamed('MySubscriptionBasic');
                                    } else if (currentUserDocument?.plan ==
                                        Plan.standar) {
                                      context
                                          .pushNamed('MySubscriptionStandard');
                                    } else {
                                      context
                                          .pushNamed('MySubscriptionPremium');
                                    }
                                  },
                                  child: wrapWithModel(
                                    model: _model.accountOptionModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AccountOptionWidget(
                                      key: ValueKey('subscription'),
                                      icon: Icon(
                                        key: ValueKey('subscription'),
                                        Icons.card_membership_outlined,
                                        size: 30.0,
                                      ),
                                      text: 'My subscription',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if ((currentUserDocument?.rol == Roles.profesional) &&
                            (currentUserDocument?.business == null) &&
                            (currentUserDocument?.plan != Plan.premiun))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 56.0,
                                decoration: const BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Premium',
                                      queryParameters: {
                                        'userRef': serializeParam(
                                          currentUserReference,
                                          ParamType.DocumentReference,
                                        ),
                                        'currentPlan': serializeParam(
                                          currentUserDocument?.plan,
                                          ParamType.Enum,
                                        ),
                                        'isUpdatePremiun': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Group_42.png',
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Container(
                          width: 326.0,
                          height: 52.0,
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Profilesettings');
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: const AccountOptionWidget(
                                key: ValueKey('profile'),
                                icon: Icon(
                                  key: ValueKey('profile'),
                                  Icons.location_history,
                                  size: 30.0,
                                ),
                                text: 'My profile',
                              ),
                            ),
                          ),
                        ),
                        if (currentUserDocument?.rol == Roles.business)
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 326.0,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.code =
                                          functions.generateRandomCode();
                                      _model.codes = await queryCodesRecordOnce(
                                        queryBuilder: (codesRecord) =>
                                            codesRecord.where(
                                          'business',
                                          isEqualTo: currentUserReference,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if ((_model.codes != null) == true) {
                                        _model.code = _model.codes?.code;
                                      } else {
                                        var codesRecordReference =
                                            CodesRecord.collection.doc();
                                        await codesRecordReference
                                            .set(createCodesRecordData(
                                          business: currentUserReference,
                                          code: _model.code,
                                          name: valueOrDefault(
                                              currentUserDocument?.comapny, ''),
                                        ));
                                        _model.newCode =
                                            CodesRecord.getDocumentFromData(
                                                createCodesRecordData(
                                                  business:
                                                      currentUserReference,
                                                  code: _model.code,
                                                  name: valueOrDefault(
                                                      currentUserDocument
                                                          ?.comapny,
                                                      ''),
                                                ),
                                                codesRecordReference);
                                      }

                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.accountOptionModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: const AccountOptionWidget(
                                        key: ValueKey('seeCode'),
                                        icon: Icon(
                                          key: ValueKey('seeCode'),
                                          Icons.password,
                                          size: 30.0,
                                        ),
                                        text: 'See my code',
                                      ),
                                    ),
                                  ),
                                  if (_model.code != null && _model.code != '')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          key: const ValueKey('copyCode'),
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            key: const ValueKey('copyCode'),
                                            Icons.content_copy,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 23.0,
                                          ),
                                          onPressed: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: _model.code!));
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: SelectionArea(
                                              child: Text(
                                            key: const ValueKey('code'),
                                            _model.code!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          )),
                                        ),
                                      ],
                                    ),
                                ].divide(const SizedBox(height: 3.0)),
                              ),
                            ),
                          ),
                        Container(
                          width: 326.0,
                          height: 52.0,
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('BlockList');
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel4,
                              updateCallback: () => safeSetState(() {}),
                              child: const AccountOptionWidget(
                                key: ValueKey('block'),
                                icon: Icon(
                                  key: ValueKey('block'),
                                  Icons.no_accounts,
                                  size: 30.0,
                                ),
                                text: 'Blocked list',
                              ),
                            ),
                          ),
                        ),
                        if ((currentUserDocument?.rol != Roles.user) &&
                            (currentUserDocument?.business == null))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 64.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 326.0,
                                height: 52.0,
                                decoration: const BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'MembresiasV2',
                                      queryParameters: {
                                        'professionalUpdate': serializeParam(
                                          currentUserReference,
                                          ParamType.DocumentReference,
                                        ),
                                        'currentPlan': serializeParam(
                                          currentUserDocument?.plan,
                                          ParamType.Enum,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: wrapWithModel(
                                    model: _model.accountOptionModel5,
                                    updateCallback: () => safeSetState(() {}),
                                    child: const AccountOptionWidget(
                                      key: ValueKey('change'),
                                      icon: Icon(
                                        key: ValueKey('change'),
                                        Icons.contact_emergency,
                                        size: 30.0,
                                      ),
                                      text: 'Change subscription',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 326.0,
                            height: 52.0,
                            decoration: const BoxDecoration(),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(
                                    'https://icareapp.com.au/privacy-policy');
                              },
                              child: wrapWithModel(
                                model: _model.accountOptionModel6,
                                updateCallback: () => safeSetState(() {}),
                                child: const AccountOptionWidget(
                                  key: ValueKey('terms'),
                                  icon: Icon(
                                    key: ValueKey('terms'),
                                    Icons.contact_page_outlined,
                                    size: 30.0,
                                  ),
                                  text: 'Terms and conditions',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.85,
                                height: 52.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F3F3),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.showLanguagues =
                                        !_model.showLanguagues;
                                    safeSetState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-0.85, 0.0),
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF60303),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  child: Image.asset(
                                                    'assets/images/R_(1)_(1).png',
                                                    width: 200.0,
                                                    height: 200.0,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  child: Image.asset(
                                                    'assets/images/R_(2)_(1).png',
                                                    width: 200.0,
                                                    height: 200.0,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            () {
                                              if (FFLocalizations.of(context)
                                                      .languageCode ==
                                                  'en') {
                                                return 'English';
                                              } else if (FFLocalizations.of(
                                                          context)
                                                      .languageCode ==
                                                  'es') {
                                                return 'Español';
                                              } else {
                                                return 'English';
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF57636C),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (valueOrDefault<bool>(
                              _model.showLanguagues,
                              false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Container(
                                  width: 326.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F3F3),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setAppLanguage(context, 'en');
                                          _model.showLanguagues =
                                              !_model.showLanguagues;
                                          safeSetState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30.0),
                                                  bottomRight:
                                                      Radius.circular(30.0),
                                                  topLeft:
                                                      Radius.circular(30.0),
                                                  topRight:
                                                      Radius.circular(30.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/R_(1)_(1).png',
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              () {
                                                if (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'en') {
                                                  return 'English';
                                                } else if (FFLocalizations.of(
                                                            context)
                                                        .languageCode ==
                                                    'es') {
                                                  return 'Inglés';
                                                } else {
                                                  return 'English';
                                                }
                                              }(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setAppLanguage(context, 'es');
                                          _model.showLanguagues =
                                              !_model.showLanguagues;
                                          safeSetState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 60.0,
                                              height: 60.0,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30.0),
                                                  bottomRight:
                                                      Radius.circular(30.0),
                                                  topLeft:
                                                      Radius.circular(30.0),
                                                  topRight:
                                                      Radius.circular(30.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/R_(2)_(1).png',
                                                  width: 200.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              () {
                                                if (FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'en') {
                                                  return 'Spanish';
                                                } else if (FFLocalizations.of(
                                                            context)
                                                        .languageCode ==
                                                    'es') {
                                                  return 'Español';
                                                } else {
                                                  return 'Spanish';
                                                }
                                              }(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Container(
                          width: 326.0,
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Deleteaccount');
                            },
                            child: wrapWithModel(
                              model: _model.accountOptionModel7,
                              updateCallback: () => safeSetState(() {}),
                              child: const AccountOptionWidget(
                                key: ValueKey('delete'),
                                icon: Icon(
                                  key: ValueKey('delete'),
                                  Icons.delete_sweep,
                                ),
                                text: 'Delete account',
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 40.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().authUserFireBase = false;

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  isActive: false,
                                ));
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth('Login', context.mounted);
                              },
                              text: FFLocalizations.of(context).getText(
                                'ajizgdzt' /* Sign out */,
                              ),
                              icon: const Icon(
                                Icons.login_sharp,
                                size: 25.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 12.0))
                          .addToStart(const SizedBox(height: 0.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.01),
                child: Container(
                  height: 73.0,
                  decoration: const BoxDecoration(
                    color: Color(0xBEB928B8),
                  ),
                  child: Builder(
                    builder: (context) {
                      if (currentUserDocument?.rol != Roles.business) {
                        return wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarWidget(),
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.navbarPremiunModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarPremiunWidget(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
