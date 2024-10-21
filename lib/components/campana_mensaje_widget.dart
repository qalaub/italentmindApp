import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'campana_mensaje_model.dart';
export 'campana_mensaje_model.dart';

class CampanaMensajeWidget extends StatefulWidget {
  /// mensaje para fotos
  const CampanaMensajeWidget({super.key});

  @override
  State<CampanaMensajeWidget> createState() => _CampanaMensajeWidgetState();
}

class _CampanaMensajeWidgetState extends State<CampanaMensajeWidget> {
  late CampanaMensajeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CampanaMensajeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76.6,
      height: 76.6,
      decoration: const BoxDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'assets/images/Notifications_Message.png',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
