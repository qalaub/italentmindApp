import '/flutter_flow/flutter_flow_util.dart';
import 'image_upload_widget.dart' show ImageUploadWidget;
import 'package:flutter/material.dart';

class ImageUploadModel extends FlutterFlowModel<ImageUploadWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future prueba(BuildContext context) async {}
}
