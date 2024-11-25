import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'descripcion_user_model.dart';
export 'descripcion_user_model.dart';

class DescripcionUserWidget extends StatefulWidget {
  const DescripcionUserWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final String? parameter1;
  final String? parameter2;

  @override
  State<DescripcionUserWidget> createState() => _DescripcionUserWidgetState();
}

class _DescripcionUserWidgetState extends State<DescripcionUserWidget> {
  late DescripcionUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescripcionUserModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qi6cj2f5' /* Description */,
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Montserrat',
                            color: const Color(0xFFC14BBC),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.01, -0.69),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFEFE),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  widget.parameter1!,
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 353.0,
          child: Divider(
            thickness: 1.0,
            color: Color(0xDEBAB7B7),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
            child: Container(
              width: double.infinity,
              height: 486.0,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Conversation.png',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
