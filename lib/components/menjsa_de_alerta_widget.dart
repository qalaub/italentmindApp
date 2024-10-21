import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'menjsa_de_alerta_model.dart';
export 'menjsa_de_alerta_model.dart';

class MenjsaDeAlertaWidget extends StatefulWidget {
  /// mensaje para fotos
  const MenjsaDeAlertaWidget({super.key});

  @override
  State<MenjsaDeAlertaWidget> createState() => _MenjsaDeAlertaWidgetState();
}

class _MenjsaDeAlertaWidgetState extends State<MenjsaDeAlertaWidget> {
  late MenjsaDeAlertaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenjsaDeAlertaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Text(
          FFLocalizations.of(context).getText(
            'gxirv60i' /* Please upload photos to comple... */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Montserrat',
                color: const Color(0xFFE90606),
                fontSize: 13.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
