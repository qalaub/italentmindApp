import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v3correciones/user_fav0rites/v3fv0ritesv3/v3fv0ritesv3_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'fav_v3_copy_model.dart';
export 'fav_v3_copy_model.dart';

class FavV3CopyWidget extends StatefulWidget {
  const FavV3CopyWidget({super.key});

  @override
  State<FavV3CopyWidget> createState() => _FavV3CopyWidgetState();
}

class _FavV3CopyWidgetState extends State<FavV3CopyWidget> {
  late FavV3CopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavV3CopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: const Color(0xFF4963C9),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: const FaIcon(
            FontAwesomeIcons.angleLeft,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'sgzeqrp6' /* Favorites */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Montserrat',
                color: const Color(0xFFEFECF3),
                fontSize: 24.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/fondo-italente_(2).png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.802,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.75,
                    ),
                    decoration: const BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Builder(
                              builder: (context) {
                                final userList =
                                    (currentUserDocument?.favorites.toList() ??
                                            [])
                                        .where((e) =>
                                            (currentUserDocument?.blockList
                                                        .toList() ??
                                                    [])
                                                .contains(e) ==
                                            false)
                                        .toList();

                                return ListView.separated(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16.0,
                                    0,
                                    0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: userList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 16.0),
                                  itemBuilder: (context, userListIndex) {
                                    final userListItem =
                                        userList[userListIndex];
                                    return V3fv0ritesv3Widget(
                                      key: Key(
                                          'Keyx8t_${userListIndex}_of_${userList.length}'),
                                      profesionalId: userListItem,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      height: 73.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1D69D7),
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
          ],
        ),
      ),
    );
  }
}
