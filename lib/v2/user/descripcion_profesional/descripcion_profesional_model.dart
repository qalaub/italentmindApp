import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/v2/professional/imganes/imganes_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'descripcion_profesional_widget.dart' show DescripcionProfesionalWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
