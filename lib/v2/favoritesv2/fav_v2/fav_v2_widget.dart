import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v3correciones/likes_v3/likes_v3/likes_v3_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'fav_v2_model.dart';
export 'fav_v2_model.dart';

class FavV2Widget extends StatefulWidget {
  const FavV2Widget({super.key});

  @override
  State<FavV2Widget> createState() => _FavV2WidgetState();
}

class _FavV2WidgetState extends State<FavV2Widget> {
  late FavV2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavV2Model());
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
        backgroundColor: const Color(0xFF1D69D7),
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
            '2owg0jwu' /* Favorites */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Montserrat',
                color: const Color(0xFFEFECF3),
                fontSize: 25.0,
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
                    'assets/images/F0NDer_fav2_(1).png',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.75,
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
                                    return LikesV3Widget(
                                      key: Key(
                                          'Key2vm_${userListIndex}_of_${userList.length}'),
                                      professionalRef: userListItem,
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
                      height: 69.0,
                      decoration: const BoxDecoration(
                        color: Color(0xB3B928B8),
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
