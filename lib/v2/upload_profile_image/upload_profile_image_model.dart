import '/auth/firebase_auth/auth_util.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'upload_profile_image_widget.dart' show UploadProfileImageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadProfileImageModel
    extends FlutterFlowModel<UploadProfileImageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for imageUpload component.
  late ImageUploadModel imageUploadModel1;
  // Model for imageUpload component.
  late ImageUploadModel imageUploadModel2;
  // Model for imageUpload component.
  late ImageUploadModel imageUploadModel3;
  // Model for imageUpload component.
  late ImageUploadModel imageUploadModel4;
  // Model for imageUpload component.
  late ImageUploadModel imageUploadModel5;
  // Model for imageUpload component.
  late ImageUploadModel imageUploadModel6;

  @override
  void initState(BuildContext context) {
    imageUploadModel1 = createModel(context, () => ImageUploadModel());
    imageUploadModel2 = createModel(context, () => ImageUploadModel());
    imageUploadModel3 = createModel(context, () => ImageUploadModel());
    imageUploadModel4 = createModel(context, () => ImageUploadModel());
    imageUploadModel5 = createModel(context, () => ImageUploadModel());
    imageUploadModel6 = createModel(context, () => ImageUploadModel());
  }

  @override
  void dispose() {
    imageUploadModel1.dispose();
    imageUploadModel2.dispose();
    imageUploadModel3.dispose();
    imageUploadModel4.dispose();
    imageUploadModel5.dispose();
    imageUploadModel6.dispose();
  }
}
