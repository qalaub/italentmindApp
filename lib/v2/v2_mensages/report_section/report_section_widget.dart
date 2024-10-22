import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'report_section_model.dart';
export 'report_section_model.dart';

class ReportSectionWidget extends StatefulWidget {
  const ReportSectionWidget({
    super.key,
    required this.report,
    required this.user1,
    required this.user2,
  });

  final String? report;
  final String? user1;
  final String? user2;

  @override
  State<ReportSectionWidget> createState() => _ReportSectionWidgetState();
}

class _ReportSectionWidgetState extends State<ReportSectionWidget> {
  late ReportSectionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportSectionModel());
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
            decoration: const BoxDecoration(
              color: Color(0xFF272727),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/IMGEN.png',
                      ).image,
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 31.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'az0zlc0g' /* Harassment */,
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
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6bwq77pv' /* A system employee reviews 
mes... */
                                  ,
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
                          ],
                        ),
                      ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.01, 0.7),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 168.0, 0.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await launchUrl(Uri(
                            scheme: 'mailto',
                            path: 'harrysonleal17@gmail.com',
                            query: {
                              'subject': 'Report',
                              'body': functions.generateBodyForEmail(
                                  widget.user1!,
                                  widget.user2!,
                                  widget.report!),
                            }
                                .entries
                                .map((MapEntry<String, String> e) =>
                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&')));
                      },
                      text: FFLocalizations.of(context).getText(
                        '40pxjkye' /* Send report */,
                      ),
                      options: FFButtonOptions(
                        width: 275.0,
                        height: 45.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF4963C9),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 5.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
