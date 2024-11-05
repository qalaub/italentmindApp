import '/components/eliminar_mensaje_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deleteaccount_success_widget.dart' show DeleteaccountSuccessWidget;
import 'package:flutter/material.dart';

class DeleteaccountSuccessModel
    extends FlutterFlowModel<DeleteaccountSuccessWidget> {
  ///  Local state fields for this page.

  bool deleted = false;

  ///  State fields for stateful widgets in this page.

  // Model for Eliminar_mensaje component.
  late EliminarMensajeModel eliminarMensajeModel;

  @override
  void initState(BuildContext context) {
    eliminarMensajeModel = createModel(context, () => EliminarMensajeModel());
  }

  @override
  void dispose() {
    eliminarMensajeModel.dispose();
  }
}
