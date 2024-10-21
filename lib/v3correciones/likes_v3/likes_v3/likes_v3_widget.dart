import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'likes_v3_model.dart';
export 'likes_v3_model.dart';

class LikesV3Widget extends StatefulWidget {
  const LikesV3Widget({
    super.key,
    this.professionalRef,
  });

  final DocumentReference? professionalRef;

  @override
  State<LikesV3Widget> createState() => _LikesV3WidgetState();
}

class _LikesV3WidgetState extends State<LikesV3Widget> {
  late LikesV3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikesV3Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.newUser = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.professionalRef?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.apiResult63q = await GetNamePlaceCall.call(
        lat: functions.latLngToString(_model.newUser!.suburb!),
      );

      if ((_model.apiResult63q?.succeeded ?? true)) {
        _model.newSuburb = GetNamePlaceCall.street(
          (_model.apiResult63q?.jsonBody ?? ''),
        )!
            .first
            .toString();
        safeSetState(() {});
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
    return Align(
      alignment: const AlignmentDirectional(0.0, -0.9),
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord.where(
            'uid',
            isEqualTo: widget.professionalRef?.id,
            isNull: (widget.professionalRef?.id) == null,
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
            height: 124.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF2CCF1),
              borderRadius: BorderRadius.circular(22.0),
              shape: BoxShape.rectangle,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -0.6),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeOutDuration: const Duration(milliseconds: 500),
                        imageUrl: valueOrDefault<String>(
                          containerUsersRecord?.photoUrl,
                          'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                        ),
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        height: 59.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: 100.0,
                    decoration: const BoxDecoration(),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Icon(
                                  FFIcons.ksearch,
                                  color: Color(0xFF27479B),
                                  size: 18.0,
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '3blsmgx7' /* :   */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: const Color(0xFF27479B),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '0rovwbhn' /* Therapeut */,
                                          ),
                                          style: GoogleFonts.getFont(
                                            'Montserrat',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Icon(
                                  FFIcons.kubicationplane,
                                  color: Color(0xFF27479B),
                                  size: 20.0,
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'd5fsigxw' /* :   */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: const Color(0xFF27479B),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        TextSpan(
                                          text: functions
                                              .extractStateAndPostalCode(
                                                  _model.newSuburb),
                                          style: GoogleFonts.getFont(
                                            'Montserrat',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                            .divide(const SizedBox(height: 4.0))
                            .addToStart(const SizedBox(height: 3.0)),
                      ),
                    ),
                  ),
                ),
              ]
                  .divide(const SizedBox(width: 8.0))
                  .addToStart(const SizedBox(width: 12.0))
                  .addToEnd(const SizedBox(width: 12.0)),
            ),
          );
        },
      ),
    );
  }
}
