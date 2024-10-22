import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'v3fv0ritesv3_model.dart';
export 'v3fv0ritesv3_model.dart';

class V3fv0ritesv3Widget extends StatefulWidget {
  const V3fv0ritesv3Widget({
    super.key,
    required this.profesionalId,
  });

  final DocumentReference? profesionalId;

  @override
  State<V3fv0ritesv3Widget> createState() => _V3fv0ritesv3WidgetState();
}

class _V3fv0ritesv3WidgetState extends State<V3fv0ritesv3Widget> {
  late V3fv0ritesv3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => V3fv0ritesv3Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userCurrent = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.where(
          'uid',
          isEqualTo: widget.profesionalId?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.apiResult23d = await GetNamePlaceCall.call(
        lat: functions.latLngToString(_model.userCurrent!.suburb!),
      );

      if ((_model.apiResult23d?.succeeded ?? true)) {
        _model.newSuburb = GetNamePlaceCall.street(
          (_model.apiResult23d?.jsonBody ?? ''),
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
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 0.0,
                      color: Color(0xFF8BA4FF),
                      offset: Offset(
                        7.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 29.0, 0.0, 0.0),
                            child: Container(
                              width: 63.0,
                              height: 63.0,
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
                                      'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
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
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 5.0, 0.0, 0.0),
                            child: StreamBuilder<List<ReviewsRecord>>(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: RatingBar.builder(
                                            onRatingUpdate: (newValue) async {
                                              safeSetState(() => _model
                                                  .ratingBarValue = newValue);
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
                                                          isEqualTo: widget
                                                              .profesionalId,
                                                        ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.reviewsC?.reference !=
                                                  null) {
                                                await _model.reviewsC!.reference
                                                    .update(
                                                        createReviewsRecordData(
                                                  num: _model.ratingBarValue
                                                      ?.round(),
                                                ));
                                              } else {
                                                await ReviewsRecord.collection
                                                    .doc()
                                                    .set(
                                                        createReviewsRecordData(
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
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star_rate,
                                              color: Color(0xFFF9BF11),
                                            ),
                                            direction: Axis.horizontal,
                                            initialRating:
                                                _model.ratingBarValue ??=
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
                                            itemSize: 12.0,
                                            glowColor: const Color(0xFFF9BF11),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                );
                              },
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
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                functions.upperCaseFirstLetter(
                                    containerUsersRecord.firtsName),
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
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
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
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
                            color: Colors.white,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.09, 0.52),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                6.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 160.0,
                              height: 69.0,
                              decoration: const BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-0.17, 0.1),
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
                                                FFIcons.kcheck,
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
                                                containerUsersRecord
                                                                .ndis !=
                                                            ''
                                                    ? 'Registered Provider'
                                                    : 'Unregistered Provider',
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
                                  Align(
                                    alignment:
                                        const AlignmentDirectional(-0.03, 0.18),
                                    child: Container(
                                      width: 150.0,
                                      height: 16.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Stack(
                                          children: [
                                            const Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Icon(
                                                Icons.business_center_outlined,
                                                color: Colors.white,
                                                size: 14.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'joz42w7i' /* Experience   */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            containerUsersRecord
                                                                .years
                                                                .toString(),
                                                        style: const TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '19r7qdvc' /*  years */,
                                                        ),
                                                        style: const TextStyle(),
                                                      )
                                                    ],
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
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-0.17, 0.1),
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
                                                FFIcons.kubication,
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
                                                functions.formatnameStreet(
                                                    _model.newSuburb),
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
                                ]
                                    .divide(const SizedBox(height: 8.0))
                                    .addToEnd(const SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            decoration: const BoxDecoration(),
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
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, -0.19),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
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
