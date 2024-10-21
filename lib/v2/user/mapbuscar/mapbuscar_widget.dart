import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mapbuscar_model.dart';
export 'mapbuscar_model.dart';

class MapbuscarWidget extends StatefulWidget {
  const MapbuscarWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget? icon;
  final String? text;

  @override
  State<MapbuscarWidget> createState() => _MapbuscarWidgetState();
}

class _MapbuscarWidgetState extends State<MapbuscarWidget> {
  late MapbuscarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapbuscarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      decoration: const BoxDecoration(
        color: Color(0xDAFFFFFF),
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.location_on,
            color: Color(0xFFD26AD2),
            size: 32.0,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            decoration: const BoxDecoration(),
            child: Text(
              valueOrDefault<String>(
                widget.text,
                'text',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Icon(
            Icons.arrow_outward,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
