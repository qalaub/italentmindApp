import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'tinderv2_c0_model.dart';
export 'tinderv2_c0_model.dart';

class Tinderv2C0Widget extends StatefulWidget {
  const Tinderv2C0Widget({
    super.key,
    required this.professional,
  });

  final UsersRecord? professional;

  @override
  State<Tinderv2C0Widget> createState() => _Tinderv2C0WidgetState();
}

class _Tinderv2C0WidgetState extends State<Tinderv2C0Widget> {
  late Tinderv2C0Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Tinderv2C0Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultipr = await GetNamePlaceCall.call(
        lat: functions.latLngToString(widget.professional!.suburb!),
      );

      if ((_model.apiResultipr?.succeeded ?? true)) {
        _model.newSuburb = valueOrDefault<String>(
          GetNamePlaceCall.street(
            (_model.apiResultipr?.jsonBody ?? ''),
          )?.first?.toString(),
          'location',
        );
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
      child: Material(
        color: Colors.transparent,
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          height: MediaQuery.sizeOf(context).height * 1.0,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width * 1.0,
            maxHeight: MediaQuery.sizeOf(context).height * 0.65,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFA39C9C), Colors.white],
              stops: [0.0, 0.5],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            border: Border.all(
              color: const Color(0xFF1D69D7),
              width: 3.0,
            ),
          ),
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.465,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Builder(
                            builder: (context) {
                              final imagesProfessional = widget
                                      .professional?.images
                                      .map((e) => e)
                                      .toList()
                                      .where((e) => e != '')
                                      .toList()
                                      .toList() ??
                                  [];

                              return SizedBox(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  0,
                                                  imagesProfessional.length -
                                                      1))),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imagesProfessional.length,
                                  itemBuilder:
                                      (context, imagesProfessionalIndex) {
                                    final imagesProfessionalItem =
                                        imagesProfessional[
                                            imagesProfessionalIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await _model.pageViewController
                                            ?.nextPage(
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 600),
                                          fadeOutDuration:
                                              const Duration(milliseconds: 600),
                                          imageUrl: valueOrDefault<String>(
                                            imagesProfessionalItem,
                                            'https://i.ibb.co/b7TBHQJ/imagen-defecto.png',
                                          ),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        if (valueOrDefault<bool>(
                          (widget.professional?.business != null) ||
                              (widget.professional?.rol == Roles.business),
                          false,
                        ))
                          Align(
                            alignment: const AlignmentDirectional(0.95, 0.95),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (widget.professional?.rol ==
                                      Roles.profesional) {
                                    return FutureBuilder<UsersRecord>(
                                      future: UsersRecord.getDocumentOnce(
                                          widget.professional!.business!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final imageUsersRecord = snapshot.data!;

                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            imageUsersRecord.photoUrl,
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        widget.professional!.photoUrl,
                                        width: 200.0,
                                        height: 200.0,
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 183.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 4.0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.sizeOf(context).width * 0.7,
                                  maxHeight:
                                      MediaQuery.sizeOf(context).height * 0.12,
                                ),
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            functions.upperCaseFirstLetter(
                                                valueOrDefault<String>(
                                              widget.professional?.firtsName,
                                              'sandra',
                                            )),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Color(0xFF1D69D7),
                                            size: 14.0,
                                          ),
                                          Text(
                                            functions.formatnameStreet(
                                                _model.newSuburb),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4,
                                            height: 30.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF4D87DA),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(30.0),
                                                bottomRight:
                                                    Radius.circular(30.0),
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: AutoSizeText(
                                                valueOrDefault<String>(
                                                  widget.professional
                                                      ?.serviceType.first,
                                                  'service',
                                                ).maybeHandleOverflow(
                                                    maxChars: 24),
                                                minFontSize: 11.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.29,
                                            height: 30.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF4D87DA),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(30.0),
                                                bottomRight:
                                                    Radius.circular(30.0),
                                                topLeft: Radius.circular(30.0),
                                                topRight: Radius.circular(30.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        widget
                                                            .professional?.years
                                                            .toString(),
                                                        '4',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.white,
                                                            fontSize: 11.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    TextSpan(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'sumldv79' /*  years of Exp */,
                                                      ),
                                                      style: const TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ]
                                        .divide(const SizedBox(height: 5.0))
                                        .addToStart(const SizedBox(height: 3.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 0.0, 0.0),
                              child: StreamBuilder<List<ReviewsRecord>>(
                                stream: queryReviewsRecord(
                                  queryBuilder: (reviewsRecord) =>
                                      reviewsRecord.where(
                                    'professional',
                                    isEqualTo: widget.professional?.reference,
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<ReviewsRecord>
                                      containerReviewsRecordList =
                                      snapshot.data!;

                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.55,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.045,
                                    decoration: const BoxDecoration(),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Text(
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
                                                  '4,5',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -0.8),
                                              child: RatingBar.builder(
                                                onRatingUpdate: (newValue) =>
                                                    safeSetState(() =>
                                                        _model.ratingBarValue =
                                                            newValue),
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star_rounded,
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
                                                  3.0,
                                                ),
                                                unratedColor: const Color(0x4D040202),
                                                itemCount: 5,
                                                itemSize: 20.0,
                                                glowColor: const Color(0xFFF9BF11),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -0.7),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.concatStrings(
                                                      '(',
                                                      ')',
                                                      valueOrDefault<String>(
                                                        containerReviewsRecordList
                                                            .length
                                                            .toString(),
                                                        '1278',
                                                      )),
                                                  '(1278)',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, -0.7),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: wrapWithModel(
                            model: _model.membresiaLogoModel,
                            updateCallback: () => safeSetState(() {}),
                            child: MembresiaLogoWidget(
                              width: 60,
                              heigth: 60,
                              professional: widget.professional!.reference,
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 2.0)),
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
