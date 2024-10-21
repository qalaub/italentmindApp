import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/components/listofcollaborators_p_e_r_f_i_l_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'listofcollaborators_model.dart';
export 'listofcollaborators_model.dart';

class ListofcollaboratorsWidget extends StatefulWidget {
  const ListofcollaboratorsWidget({super.key});

  @override
  State<ListofcollaboratorsWidget> createState() =>
      _ListofcollaboratorsWidgetState();
}

class _ListofcollaboratorsWidgetState extends State<ListofcollaboratorsWidget> {
  late ListofcollaboratorsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListofcollaboratorsModel());
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
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFA41414),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/F0NDer_fav3_(1).png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Rectangle_7.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ne4o1aq8' /* List Of Collaborators */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.88, -0.7),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                valueOrDefault<String>(
                                  functions.concatStrings(
                                      (currentUserDocument?.professionals
                                                  .toList() ??
                                              [])
                                          .length
                                          .toString(),
                                      '10',
                                      '/'),
                                  '3/10',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.6),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.86,
                              height: MediaQuery.sizeOf(context).height * 0.76,
                              decoration: const BoxDecoration(),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final colaborators = (currentUserDocument
                                                ?.professionals
                                                .toList() ??
                                            [])
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: colaborators.length,
                                      itemBuilder:
                                          (context, colaboratorsIndex) {
                                        final colaboratorsItem =
                                            colaborators[colaboratorsIndex];
                                        return ListofcollaboratorsPERFILWidget(
                                          key: Key(
                                              'Key9hk_${colaboratorsIndex}_of_${colaborators.length}'),
                                          professional: colaboratorsItem,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.01),
                            child: Container(
                              height: 73.0,
                              decoration: const BoxDecoration(
                                color: Color(0xD5B928B8),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (currentUserDocument?.rol !=
                                      Roles.business) {
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
