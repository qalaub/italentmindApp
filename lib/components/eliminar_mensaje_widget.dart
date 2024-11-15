import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eliminar_mensaje_model.dart';
export 'eliminar_mensaje_model.dart';

class EliminarMensajeWidget extends StatefulWidget {
  const EliminarMensajeWidget({super.key});

  @override
  State<EliminarMensajeWidget> createState() => _EliminarMensajeWidgetState();
}

class _EliminarMensajeWidgetState extends State<EliminarMensajeWidget> {
  late EliminarMensajeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EliminarMensajeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Colors.white,
            width: 0.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'mm8yxrkf' /* ACCOUNT DELETION SUCCESSFUL */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'pintanga',
                        color: Color(0xFF1D69D7),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              SizedBox(
                width: 364.0,
                child: Divider(
                  thickness: 2.8,
                  color: Color(0xFF4963C9),
                ),
              ),
              Container(
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'bei0ybwd' /* Your account has been successf... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'pintanga',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
