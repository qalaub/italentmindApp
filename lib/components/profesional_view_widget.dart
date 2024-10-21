import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profesional_view_model.dart';
export 'profesional_view_model.dart';

class ProfesionalViewWidget extends StatefulWidget {
  const ProfesionalViewWidget({super.key});

  @override
  State<ProfesionalViewWidget> createState() => _ProfesionalViewWidgetState();
}

class _ProfesionalViewWidgetState extends State<ProfesionalViewWidget> {
  late ProfesionalViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfesionalViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Container(
          width: 321.0,
          height: 210.0,
          decoration: const BoxDecoration(
            color: Color(0xFFFFCCF9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          child: Align(
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 0.0, 0.0),
                    child: Container(
                      width: 61.0,
                      height: 61.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        border: Border.all(
                          color: const Color(0xFFD9D9D9),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://picsum.photos/seed/909/600',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.06, -1.23),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Container(
                      width: 139.0,
                      height: 30.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'xd0pzi1d' /* Migues Reyes Smit */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.06, -0.32),
                  child: Container(
                    width: 139.0,
                    height: 18.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFCCF9),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'dwydsl0d' /* 32 years */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.6),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 90.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCCF9),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'p1ftiuqd' /* I met Dylan and I understood t... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.06, -0.52),
                  child: Container(
                    width: 139.0,
                    height: 18.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFCCF9),
                    ),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'nni9655x' /* telfer psychologist */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 11.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.88, 0.85),
                  child: Container(
                    width: 139.0,
                    height: 18.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFCCF9),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '1u04gdol' /* MARCH 1, 2024 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 11.0,
                              letterSpacing: 0.0,
                            ),
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
