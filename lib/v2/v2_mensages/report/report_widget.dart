import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'report_model.dart';
export 'report_model.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({
    super.key,
    required this.user1,
    required this.user2,
  });

  final String? user1;
  final String? user2;

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  late ReportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportModel());
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
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'nql3ibcq' /* Select an issue to report */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '4455pzhh' /* We will not notify the person ... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: const Color(0xFFC6C6C6),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Harassment';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '61ebxzx7' /* Harassment */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.currentReport =
                                    'He pretends to be someone else';

                                context.pushNamed(
                                  'reportSection',
                                  queryParameters: {
                                    'report': serializeParam(
                                      _model.currentReport,
                                      ParamType.String,
                                    ),
                                    'user1': serializeParam(
                                      widget.user1,
                                      ParamType.String,
                                    ),
                                    'user2': serializeParam(
                                      widget.user2,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '1mj4qoe9' /* He pretends to be someone else */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport =
                                  'Share inappropriate content';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'u845sjct' /* Share inappropriate content */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport =
                                  'Language that incites hatred';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'hekwh489' /* Language that incites hatred */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Unauthorized sales';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ug2qtoco' /* Unauthorized sales */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Scams';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5868joma' /* Scams */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            height: 43.0,
                            thickness: 1.0,
                            color: Color(0xFFBDBDBD),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.currentReport = 'Others';

                              context.pushNamed(
                                'reportSection',
                                queryParameters: {
                                  'report': serializeParam(
                                    _model.currentReport,
                                    ParamType.String,
                                  ),
                                  'user1': serializeParam(
                                    widget.user1,
                                    ParamType.String,
                                  ),
                                  'user2': serializeParam(
                                    widget.user2,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'rpqkw71g' /* Others */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        ]
                            .addToStart(const SizedBox(height: 8.0))
                            .addToEnd(const SizedBox(height: 43.0)),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
