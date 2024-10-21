import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'account_option_model.dart';
export 'account_option_model.dart';

class AccountOptionWidget extends StatefulWidget {
  const AccountOptionWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final Widget? icon;
  final String? text;

  @override
  State<AccountOptionWidget> createState() => _AccountOptionWidgetState();
}

class _AccountOptionWidgetState extends State<AccountOptionWidget> {
  late AccountOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountOptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 52.0,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          widget.icon!,
          Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            decoration: const BoxDecoration(),
            child: Text(
              valueOrDefault<String>(
                widget.text,
                'text',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
