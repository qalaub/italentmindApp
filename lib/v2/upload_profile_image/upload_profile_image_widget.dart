import '/auth/firebase_auth/auth_util.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'upload_profile_image_model.dart';
export 'upload_profile_image_model.dart';

class UploadProfileImageWidget extends StatefulWidget {
  const UploadProfileImageWidget({
    super.key,
    this.imgs,
  });

  final List<String>? imgs;

  @override
  State<UploadProfileImageWidget> createState() =>
      _UploadProfileImageWidgetState();
}

class _UploadProfileImageWidgetState extends State<UploadProfileImageWidget> {
  late UploadProfileImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadProfileImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1.0, -1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        constraints: const BoxConstraints(
          minHeight: 225.0,
          maxHeight: 245.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFC9DEFF),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: GridView(
              padding: const EdgeInsets.fromLTRB(
                0,
                6.0,
                0,
                0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 9.0,
                childAspectRatio: 1.0,
              ),
              scrollDirection: Axis.vertical,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.imageUploadModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: ImageUploadWidget(
                      key: const ValueKey('image1'),
                      img:
                          (currentUserDocument?.images.toList() ?? []).isNotEmpty
                              ? (currentUserDocument?.images.toList() ?? [])[0]
                              : ' ',
                      index: 0,
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.imageUploadModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ImageUploadWidget(
                      key: const ValueKey('image2'),
                      img:
                          (currentUserDocument?.images.toList() ?? []).length >
                                  1
                              ? (currentUserDocument?.images.toList() ?? [])[1]
                              : ' ',
                      index: 1,
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.imageUploadModel3,
                    updateCallback: () => safeSetState(() {}),
                    child: ImageUploadWidget(
                      key: const ValueKey('image3'),
                      img:
                          (currentUserDocument?.images.toList() ?? []).length >
                                  2
                              ? (currentUserDocument?.images.toList() ?? [])[2]
                              : ' ',
                      index: 2,
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.imageUploadModel4,
                    updateCallback: () => safeSetState(() {}),
                    child: ImageUploadWidget(
                      key: const ValueKey('image4'),
                      img:
                          (currentUserDocument?.images.toList() ?? []).length >
                                  3
                              ? (currentUserDocument?.images.toList() ?? [])[3]
                              : ' ',
                      index: 3,
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.imageUploadModel5,
                    updateCallback: () => safeSetState(() {}),
                    child: ImageUploadWidget(
                      key: const ValueKey('image5'),
                      img:
                          (currentUserDocument?.images.toList() ?? []).length >
                                  4
                              ? (currentUserDocument?.images.toList() ?? [])[4]
                              : ' ',
                      index: 4,
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => wrapWithModel(
                    model: _model.imageUploadModel6,
                    updateCallback: () => safeSetState(() {}),
                    child: ImageUploadWidget(
                      key: const ValueKey('image6'),
                      img:
                          (currentUserDocument?.images.toList() ?? []).length >
                                  5
                              ? (currentUserDocument?.images.toList() ?? [])[5]
                              : ' ',
                      index: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
