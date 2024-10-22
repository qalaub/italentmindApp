import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/new_notifcations_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'news_model.dart';
export 'news_model.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late NewsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsModel());
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
        backgroundColor: const Color(0xFFE3DEDE),
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
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'gkbr94yf' /* Notification */,
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Montserrat',
                    fontSize: 23.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
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
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 0.84,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'gnqd5pjz' /* New  */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<List<NewsbusinessRecord>>(
                        stream: queryNewsbusinessRecord(
                          queryBuilder: (newsbusinessRecord) =>
                              newsbusinessRecord
                                  .where(
                                    'business',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'isView',
                                    isEqualTo: false,
                                  ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<NewsbusinessRecord>
                              listViewNewsbusinessRecordList = snapshot.data!;

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              7.0,
                              0,
                              0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewNewsbusinessRecordList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 1.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewNewsbusinessRecord =
                                  listViewNewsbusinessRecordList[listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await listViewNewsbusinessRecord.reference
                                      .update(createNewsbusinessRecordData(
                                    isView: true,
                                  ));
                                },
                                child: NewNotifcationsWidget(
                                  key: Key(
                                      'Keybx2_${listViewIndex}_of_${listViewNewsbusinessRecordList.length}'),
                                  participant: listViewNewsbusinessRecord.user!,
                                  professional:
                                      listViewNewsbusinessRecord.professional!,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'dj74n30o' /* Previous */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<List<NewsbusinessRecord>>(
                        stream: queryNewsbusinessRecord(
                          queryBuilder: (newsbusinessRecord) =>
                              newsbusinessRecord
                                  .where(
                                    'business',
                                    isEqualTo: currentUserReference,
                                  )
                                  .where(
                                    'isView',
                                    isEqualTo: true,
                                  ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<NewsbusinessRecord>
                              listViewNewsbusinessRecordList = snapshot.data!;

                          return ListView.builder(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              7.0,
                              0,
                              0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewNewsbusinessRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewNewsbusinessRecord =
                                  listViewNewsbusinessRecordList[listViewIndex];
                              return NewNotifcationsWidget(
                                key: Key(
                                    'Keynx3_${listViewIndex}_of_${listViewNewsbusinessRecordList.length}'),
                                participant: listViewNewsbusinessRecord.user!,
                                professional:
                                    listViewNewsbusinessRecord.professional!,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.01),
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
      ),
    );
  }
}
