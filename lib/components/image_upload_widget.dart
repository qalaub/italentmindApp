import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'image_upload_model.dart';
export 'image_upload_model.dart';

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({
    super.key,
    this.img,
    this.index,
    String? background,
  }) : background = background ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/xokotouxb9hk/imageText.png';

  final String? img;
  final int? index;
  final String background;

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  late ImageUploadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageUploadModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget.img != null && widget.img != '') &&
          (widget.img != 'https://i.ibb.co/b7TBHQJ/imagen-defecto.png') &&
          (widget.img != ' ')) {
        FFAppState().addToImagesUserUpload(widget.img!);
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            valueOrDefault<String>(
              _model.uploadedFileUrl != ''
                  ? valueOrDefault<String>(
                      _model.uploadedFileUrl,
                      'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                    )
                  : valueOrDefault<String>(
                      widget.img != null && widget.img != ''
                          ? widget.img
                          : widget.background,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/xokotouxb9hk/imageText.png',
                    ),
              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/xokotouxb9hk/imageText.png',
            ),
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            fit: BoxFit.cover,
          ),
        ),
        Builder(
          builder: (context) {
            if (_model.uploadedFileUrl == '') {
              return Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: const Color(0xFF1D69D7),
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xFFFFFEFE),
                    size: 24.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      imageQuality: 50,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(() => _model.isDataUploading = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl = downloadUrls.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    if (widget.index != null) {
                      if (FFAppState().imagesUserUpload.length >
                          widget.index!) {
                        FFAppState().updateImagesUserUploadAtIndex(
                          widget.index!,
                          (_) => _model.uploadedFileUrl,
                        );
                        safeSetState(() {});
                      } else {
                        FFAppState().insertAtIndexInImagesUserUpload(
                            widget.index!, _model.uploadedFileUrl);
                        safeSetState(() {});
                      }
                    } else {
                      FFAppState()
                          .addToImagesUserUpload(_model.uploadedFileUrl);
                      safeSetState(() {});
                    }
                  },
                ),
              );
            } else {
              return Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: const Color(0xFFED2AF1),
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFFFFFEFE),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    FFAppState()
                        .removeFromImagesUserUpload(_model.uploadedFileUrl);
                    safeSetState(() {});
                    await FirebaseStorage.instance
                        .refFromURL(_model.uploadedFileUrl)
                        .delete();
                    safeSetState(() {
                      _model.isDataUploading = false;
                      _model.uploadedLocalFile =
                          FFUploadedFile(bytes: Uint8List.fromList([]));
                      _model.uploadedFileUrl = '';
                    });
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
