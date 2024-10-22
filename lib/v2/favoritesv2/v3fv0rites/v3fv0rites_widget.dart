import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'v3fv0rites_model.dart';
export 'v3fv0rites_model.dart';

class V3fv0ritesWidget extends StatefulWidget {
  const V3fv0ritesWidget({
    super.key,
    required this.profesionalId,
  });

  final DocumentReference? profesionalId;

  @override
  State<V3fv0ritesWidget> createState() => _V3fv0ritesWidgetState();
}

class _V3fv0ritesWidgetState extends State<V3fv0ritesWidget> {
  late V3fv0ritesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => V3fv0ritesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.profesionalId!),
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

          final containerUsersRecord = snapshot.data!;

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (!loggedIn) {
                context.pushNamed('Login');
              } else {
                context.pushNamed(
                  'ProfileInfo',
                  queryParameters: {
                    'professional': serializeParam(
                      widget.profesionalId,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              }
            },
            child: Material(
              color: Colors.transparent,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                width: 285.0,
                height: 139.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D69D7),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 11.0, 0.0, 0.0),
                            child: Container(
                              width: 61.0,
                              height: 61.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                border: Border.all(
                                  color: const Color(0xFFD9D9D9),
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(-1.0, 1.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      containerUsersRecord.photoUrl,
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/italentmind-fog8iw/assets/stx0cdmjoua0/italentLogo.png',
                                    ),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.06, -1.23),
                          child: Container(
                            width: 160.0,
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  functions.upperCaseFirstLetter(
                                      containerUsersRecord.firtsName),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.05, -0.19),
                          child: Container(
                            width: 160.0,
                            height: 18.0,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                containerUsersRecord.serviceType.first,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 160.0,
                          child: Divider(
                            height: 11.0,
                            thickness: 1.0,
                            indent: 5.0,
                            endIndent: 5.0,
                            color: Color(0xCCFFFFFF),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.09, 0.52),
                          child: Container(
                            width: 160.0,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-0.03, 0.18),
                                  child: Container(
                                    width: 150.0,
                                    height: 16.0,
                                    decoration: const BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        const Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Icon(
                                            Icons.business_center_outlined,
                                            color: Colors.white,
                                            size: 14.0,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ukeuwrw8' /* Experience   */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: containerUsersRecord
                                                        .years
                                                        .toString(),
                                                    style: const TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'mxc29prl' /*  years */,
                                                    ),
                                                    style: const TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-0.17, 0.1),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 150.0,
                                      height: 16.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          const Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 3.0),
                                              child: Icon(
                                                Icons.edit_document,
                                                color: Colors.white,
                                                size: 13.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'aquunf8o' /* Qualified And Certified 
perso... */
                                                  ,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(const SizedBox(height: 0.0))
                                  .addToStart(const SizedBox(height: 3.0)),
                            ),
                          ),
                        ),
                        StreamBuilder<List<ReviewsRecord>>(
                          stream: queryReviewsRecord(
                            queryBuilder: (reviewsRecord) =>
                                reviewsRecord.where(
                              'professional',
                              isEqualTo: widget.profesionalId,
                            ),
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
                            List<ReviewsRecord> containerReviewsRecordList =
                                snapshot.data!;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.concatStrings(
                                          valueOrDefault<String>(
                                            functions
                                                .averagueReviews(
                                                    containerReviewsRecordList
                                                        .toList())
                                                .toString(),
                                            '3',
                                          ),
                                          '0',
                                          ','),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: RatingBar.builder(
                                        onRatingUpdate: (newValue) async {
                                          safeSetState(() =>
                                              _model.ratingBarValue = newValue);
                                          _model.reviewsC =
                                              await queryReviewsRecordOnce(
                                            queryBuilder: (reviewsRecord) =>
                                                reviewsRecord
                                                    .where(
                                                      'participant',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'professional',
                                                      isEqualTo:
                                                          widget.profesionalId,
                                                    ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if (_model.reviewsC?.reference !=
                                              null) {
                                            await _model.reviewsC!.reference
                                                .update(createReviewsRecordData(
                                              num: _model.ratingBarValue
                                                  ?.round(),
                                            ));
                                          } else {
                                            await ReviewsRecord.collection
                                                .doc()
                                                .set(createReviewsRecordData(
                                                  num: _model.ratingBarValue
                                                      ?.round(),
                                                  professional:
                                                      widget.profesionalId,
                                                  participant:
                                                      currentUserReference,
                                                ));
                                          }

                                          safeSetState(() {});
                                        },
                                        itemBuilder: (context, index) => const Icon(
                                          Icons.star_rate,
                                          color: Color(0xFFF9BF11),
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: _model.ratingBarValue ??=
                                            valueOrDefault<double>(
                                          functions
                                              .averagueReviews(
                                                  containerReviewsRecordList
                                                      .toList())
                                              .toDouble(),
                                          0.0,
                                        ),
                                        unratedColor: const Color(0x4D040202),
                                        itemCount: 5,
                                        itemSize: 15.0,
                                        glowColor: const Color(0xFFF9BF11),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.concatStrings(
                                            '(',
                                            ')',
                                            valueOrDefault<String>(
                                              containerReviewsRecordList.length
                                                  .toString(),
                                              '3',
                                            )),
                                        '(1278)',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 4.0)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'ProfileInfo',
                                queryParameters: {
                                  'professional': serializeParam(
                                    containerUsersRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            child: wrapWithModel(
                              model: _model.addFavoritesModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AddFavoritesWidget(
                                professional: containerUsersRecord,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, -0.19),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.membresiaLogoModel,
                              updateCallback: () => safeSetState(() {}),
                              child: MembresiaLogoWidget(
                                professional: containerUsersRecord.reference,
                                width: 40,
                                heigth: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
