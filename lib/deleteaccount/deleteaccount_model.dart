import '/backend/backend.dart';
import '/components/eliminar_mensaje_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'deleteaccount_widget.dart' show DeleteaccountWidget;
import 'package:flutter/material.dart';

class DeleteaccountModel extends FlutterFlowModel<DeleteaccountWidget> {
  ///  Local state fields for this page.

  bool deleted = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ChatsRecord? chats;
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
