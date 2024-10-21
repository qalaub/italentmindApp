import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/user/mapbuscar/mapbuscar_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'map_button_model.dart';
export 'map_button_model.dart';

class MapButtonWidget extends StatefulWidget {
  const MapButtonWidget({
    super.key,
    bool? isProfessional,
  }) : isProfessional = isProfessional ?? false;

  final bool isProfessional;

  @override
  State<MapButtonWidget> createState() => _MapButtonWidgetState();
}

class _MapButtonWidgetState extends State<MapButtonWidget> {
  late MapButtonModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapButtonModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.queryTextController ??= TextEditingController();
    _model.queryFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, -0.99),
            child: AuthUserStreamWidget(
              builder: (context) => FutureBuilder<List<UsersRecord>>(
                future: queryUsersRecordOnce(
                  queryBuilder: (usersRecord) =>
                      usersRecord.orderBy('update_time'),
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
                  List<UsersRecord> mapsAustralianUsersRecordList =
                      snapshot.data!;

                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: custom_widgets.MapsAustralian(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      current: FFAppState().tempLocation,
                      markers: currentUserDocument?.rol != Roles.user
                          ? mapsAustralianUsersRecordList
                              .where((e) =>
                                  (e.rol == Roles.user) &&
                                  functions.verifyDistanceFilter(
                                      _model.newUbication,
                                      e.suburb!,
                                      FFAppState().zoomFilter))
                              .toList()
                          : mapsAustralianUsersRecordList
                              .where((e) =>
                                  (e.rol == Roles.profesional) ||
                                  (e.rol == Roles.business))
                              .toList(),
                      distance: valueOrDefault<double>(
                        FFAppState().filtersPage.distance,
                        10.0,
                      ),
                      markersImage:
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/znz4vzyqj65b/profesionalMarker.png',
                      newUbication: _model.newUbication,
                      language: FFAppState().filtersPage.language,
                      age: FFAppState().filtersPage.age,
                      service: FFAppState().filtersPage.services,
                      isProfessional: widget.isProfessional,
                      schedule: FFAppState().filtersPage.schedule,
                    ),
                  );
                },
              ),
            ),
          ),
          if (valueOrDefault<bool>(
            _model.showMap == true,
            false,
          ))
            FlutterFlowGoogleMap(
              controller: _model.googleMapsController,
              onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
              initialLocation: _model.googleMapsCenter ??=
                  const LatLng(13.106061, -59.613158),
              markerColor: GoogleMarkerColor.violet,
              mapType: MapType.normal,
              style: GoogleMapStyle.standard,
              initialZoom: 0.0,
              allowInteraction: false,
              allowZoom: false,
              showZoomControls: false,
              showLocation: false,
              showCompass: false,
              showMapToolbar: false,
              showTraffic: false,
              centerMapOnMarkerTap: false,
            ),
          Align(
            alignment: const AlignmentDirectional(-0.04, -0.95),
            child: PointerInterceptor(
              intercepting: isWeb,
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.96,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      width: 2.0,
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -0.97),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Builder(
                          builder: (context) {
                            if (_model.isLoading == true) {
                              return Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Animation_-_1720469111880.gif',
                                  fit: BoxFit.cover,
                                ),
                              );
                            } else {
                              return Align(
                                alignment: const AlignmentDirectional(-0.82, -0.96),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2.0, 2.0, 0.0, 3.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.white,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: Colors.white,
                                    icon: const Icon(
                                      Icons.search_sharp,
                                      color: Color(0xFFDB00FF),
                                      size: 24.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: TextFormField(
                              controller: _model.queryTextController,
                              focusNode: _model.queryFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.queryTextController',
                                const Duration(milliseconds: 100),
                                () async {
                                  _model.isLoading = true;
                                  _model.apiResultuev =
                                      await GetSuggestionMapCall.call(
                                    query: _model.queryTextController.text,
                                    types: (valueOrDefault(
                                                    currentUserDocument?.role,
                                                    '') !=
                                                Roles.profesional.name) &&
                                            (valueOrDefault(
                                                    currentUserDocument?.role,
                                                    '') !=
                                                Roles.business.name)
                                        ? '(cities)'
                                        : ' ',
                                  );

                                  if ((_model.apiResultuev?.succeeded ??
                                      true)) {
                                    _model.queryResults =
                                        GetSuggestionMapCall.predictions(
                                      (_model.apiResultuev?.jsonBody ?? ''),
                                    )!
                                            .toList()
                                            .cast<QueryResultsStruct>();
                                  } else {
                                    _model.isLoading = false;
                                  }

                                  _model.isLoading = false;

                                  safeSetState(() {});
                                },
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '8xqm114z' /* City Or Zip Code */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.queryTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        if (currentUserDocument?.rol == Roles.user)
                          AuthUserStreamWidget(
                            builder: (context) => const SizedBox(
                              height: 100.0,
                              child: VerticalDivider(
                                width: 5.0,
                                thickness: 1.0,
                                indent: 5.0,
                                endIndent: 5.0,
                                color: Color(0xFFBAB4B4),
                              ),
                            ),
                          ),
                        if (currentUserDocument?.rol == Roles.user)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 2.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'Filtros',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  'eb4rjv4r' /* Filter */,
                                ),
                                icon: const Icon(
                                  Icons.filter_list_alt,
                                  color: Color(0xAEDB00FF),
                                  size: 26.0,
                                ),
                                options: FFButtonOptions(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.309,
                                  height: 39.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      14.0, 0.0, 14.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_model.queryResults.isNotEmpty)
            Align(
              alignment: const AlignmentDirectional(0.0, -0.5),
              child: PointerInterceptor(
                intercepting: isWeb,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.96,
                    height: MediaQuery.sizeOf(context).height * 0.47,
                    decoration: BoxDecoration(
                      color: const Color(0x33000000),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final newquery = _model.queryResults.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: newquery.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 0.0),
                                  itemBuilder: (context, newqueryIndex) {
                                    final newqueryItem =
                                        newquery[newqueryIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.newPlace =
                                            await GetPlaceCall.call(
                                          placeId: newqueryItem.placeId,
                                        );

                                        if ((_model.newPlace?.succeeded ??
                                            true)) {
                                          _model.newUbication =
                                              functions.concatStrings(
                                                  GetPlaceCall.location(
                                                    (_model.newPlace
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.lat.toString(),
                                                  GetPlaceCall.location(
                                                    (_model.newPlace
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?.lng.toString(),
                                                  ',');
                                          FFAppState()
                                                  .newUbicationProfessional =
                                              _model.newUbication!;
                                          FFAppState().zoomFilter = 10;
                                          _model.updatePage(() {});
                                        }
                                        _model.queryResults = [];
                                        safeSetState(() {
                                          _model.queryTextController?.clear();
                                        });

                                        safeSetState(() {});
                                      },
                                      child: MapbuscarWidget(
                                        key: Key(
                                            'Keyb3v_${newqueryIndex}_of_${newquery.length}'),
                                        icon: const Icon(
                                          Icons.location_on,
                                          color: Color(0xFFD26AD2),
                                        ),
                                        text: newqueryItem.description,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
