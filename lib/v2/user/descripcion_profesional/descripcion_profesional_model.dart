import '/flutter_flow/flutter_flow_util.dart';
import '/v2/professional/imganes/imganes_widget.dart';
import 'descripcion_profesional_widget.dart' show DescripcionProfesionalWidget;
import 'package:flutter/material.dart';

class DescripcionProfesionalModel
    extends FlutterFlowModel<DescripcionProfesionalWidget> {
  ///  Local state fields for this component.

  bool more = false;

  ///  State fields for stateful widgets in this component.

  // Model for imganes component.
  late ImganesModel imganesModel;

  @override
  void initState(BuildContext context) {
    imganesModel = createModel(context, () => ImganesModel());
  }

  @override
  void dispose() {
    imganesModel.dispose();
  }
}
