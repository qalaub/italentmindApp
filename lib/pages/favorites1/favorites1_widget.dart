import '/auth/firebase_auth/auth_util.dart';
import '/components/favorites_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'favorites1_model.dart';
export 'favorites1_model.dart';

class Favorites1Widget extends StatefulWidget {
  const Favorites1Widget({super.key});

  @override
  State<Favorites1Widget> createState() => _Favorites1WidgetState();
}

class _Favorites1WidgetState extends State<Favorites1Widget> {
  late Favorites1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Favorites1Model());
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFBD39BA),
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
              'pyke1r87' /* Favorites */,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) => Builder(
                    builder: (context) {
                      final userList =
                          (currentUserDocument?.favorites.toList() ?? [])
                              .toList();

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          35.0,
                          0,
                          0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: userList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                        itemBuilder: (context, userListIndex) {
                          final userListItem = userList[userListIndex];
                          return FavoritesWidget(
                            key: Key(
                                'Key3x7_${userListIndex}_of_${userList.length}'),
                            userRef: userListItem,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.8),
                child: wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const NavbarWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
