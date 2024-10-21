import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/block_list/user_block_options/user_block_options_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'user_block_model.dart';
export 'user_block_model.dart';

class UserBlockWidget extends StatefulWidget {
  const UserBlockWidget({
    super.key,
    Color? background,
    required this.userRef,
    required this.username,
    this.service,
    required this.image,
  }) : background = background ?? Colors.white;

  final Color background;
  final DocumentReference? userRef;
  final String? username;
  final String? service;
  final String? image;

  @override
  State<UserBlockWidget> createState() => _UserBlockWidgetState();
}

class _UserBlockWidgetState extends State<UserBlockWidget> {
  late UserBlockModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserBlockModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 90.0,
      decoration: BoxDecoration(
        color: widget.background,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 75.0,
                  height: 75.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    valueOrDefault<String>(
                      widget.image,
                      'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Text(
                            functions
                                .upperCaseFirstLetter(valueOrDefault<String>(
                              widget.username,
                              'Arlene McCoy',
                            )),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Text(
                            widget.service!,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showAlignedDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    isGlobal: false,
                    avoidOverflow: false,
                    targetAnchor: const AlignmentDirectional(-1.0, 0.0)
                        .resolve(Directionality.of(context)),
                    followerAnchor: const AlignmentDirectional(0.8, -1.2)
                        .resolve(Directionality.of(context)),
                    builder: (dialogContext) {
                      return Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                          child: UserBlockOptionsWidget(
                            userRef: widget.userRef!,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
