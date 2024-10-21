import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'v2_favoritos_componente_model.dart';
export 'v2_favoritos_componente_model.dart';

class V2FavoritosComponenteWidget extends StatefulWidget {
  const V2FavoritosComponenteWidget({
    super.key,
    this.professionalRef,
  });

  final DocumentReference? professionalRef;

  @override
  State<V2FavoritosComponenteWidget> createState() =>
      _V2FavoritosComponenteWidgetState();
}

class _V2FavoritosComponenteWidgetState
    extends State<V2FavoritosComponenteWidget> {
  late V2FavoritosComponenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => V2FavoritosComponenteModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -0.9),
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord.where(
            'uid',
            isEqualTo: widget.professionalRef?.id,
          ),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<UsersRecord> containerUsersRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final containerUsersRecord = containerUsersRecordList.isNotEmpty
              ? containerUsersRecordList.first
              : null;

          return Container(
            width: MediaQuery.sizeOf(context).width * 0.92,
            height: 105.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.0),
              shape: BoxShape.rectangle,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.0),
                    child: Image.asset(
                      'assets/images/Rectangle_5.png',
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      height: 105.0,
                      fit: BoxFit.none,
                      alignment: const Alignment(0.0, 0.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 500),
                            fadeOutDuration: const Duration(milliseconds: 500),
                            imageUrl:
                                'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                            width: MediaQuery.sizeOf(context).width * 0.18,
                            height: 63.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 100.0,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -0.1),
                                    child: Text(
                                      functions.upperCaseFirstLetter(
                                          valueOrDefault<String>(
                                        functions.concatStrings(
                                            containerUsersRecord?.firtsName,
                                            containerUsersRecord?.lastName,
                                            ' '),
                                        'claudia',
                                      )),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.56,
                                  height: 1.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.81, -0.05),
                      child: Container(
                        decoration: const BoxDecoration(),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
