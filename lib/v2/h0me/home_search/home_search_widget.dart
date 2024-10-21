import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/home_vista_cuidador_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/v3fv0rites/v3fv0rites_widget.dart';
import '/v2/h0me/map_button/map_button_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_search_model.dart';
export 'home_search_model.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({
    super.key,
    this.currentLatLng,
    bool? authUser,
  }) : authUser = authUser ?? true;

  final List<LatLng>? currentLatLng;
  final bool authUser;

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  late HomeSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeSearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(await getPermissionStatus(locationPermission))) {
        FFAppState().registerProviderForm =
            RegisterProviderTypeStruct.fromSerializableMap(jsonDecode(
                '{\"images\":\"[]\",\"serviceType\":\"[]\",\"disabilities\":\"[]\",\"schedule\":\"[\\\"Monday\\\",\\\"Tuesday\\\",\\\"Wednesday\\\",\\\"Thursday\\\",\\\"Friday\\\",\\\"Saturday\\\",\\\"Sunday\\\"]\"}'));
        await Future.delayed(const Duration(milliseconds: 1500));
        await requestPermission(locationPermission);
      }
      if (loggedIn) {
        if (currentUserDocument?.rol != Roles.user) {
          if (valueOrDefault<bool>(currentUserDocument?.freeTrial, false) ==
              true) {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 15) <
                getCurrentTimestamp.secondsSinceEpoch) {
              await currentUserReference!.update(createUsersRecordData(
                freeTrial: false,
                paymentDate: getCurrentTimestamp,
              ));
            } else {
              if (currentUserDocument?.business != null) {
                context.pushNamed('peoplewhoputyouinfavorites');
              }
            }
          } else {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 30) <
                getCurrentTimestamp.secondsSinceEpoch) {
              context.pushNamed(
                'MembresiasV2',
                queryParameters: {
                  'professionalUpdate': serializeParam(
                    currentUserReference,
                    ParamType.DocumentReference,
                  ),
                  'currentPlan': serializeParam(
                    currentUserDocument?.plan,
                    ParamType.Enum,
                  ),
                  'isUpdate': serializeParam(
                    true,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            } else {
              if (currentUserDocument?.business != null) {
                context.pushNamed('peoplewhoputyouinfavorites');
              }
            }
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Builder(
                      builder: (context) {
                        if ((currentUserDocument?.rol != Roles.profesional) &&
                            (currentUserDocument?.rol != Roles.business)) {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.1, -1.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.925,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: wrapWithModel(
                                        model: _model.mapButtonModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: const MapButtonWidget(
                                          isProfessional: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.76),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'rol',
                                          isNotEqualTo: Roles.user.serialize(),
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            containerUsersRecordList = snapshot
                                                .data!
                                                .where((u) =>
                                                    u.uid != currentUserUid)
                                                .toList();

                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 170.0,
                                          constraints: const BoxConstraints(
                                            minHeight: 150.0,
                                            maxHeight: 170.0,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: Color(0x76F9F6F6),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final containerVar = containerUsersRecordList
                                                  .where((e) =>
                                                      (functions.filterProfessionals(
                                                              e,
                                                              FFAppState()
                                                                  .filtersPage
                                                                  .distance,
                                                              FFAppState()
                                                                  .filtersPage
                                                                  .services
                                                                  .toList(),
                                                              FFAppState()
                                                                  .filtersPage
                                                                  .age
                                                                  .toList(),
                                                              FFAppState()
                                                                  .tempLocation!,
                                                              FFAppState()
                                                                  .filtersPage
                                                                  .schedule
                                                                  .toList()) ==
                                                          true) &&
                                                      !(currentUserDocument
                                                                  ?.blockList
                                                                  .toList() ??
                                                              [])
                                                          .contains(
                                                              e.reference))
                                                  .toList();

                                              return ListView.separated(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 20.0),
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: containerVar.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 20.0),
                                                itemBuilder: (context,
                                                    containerVarIndex) {
                                                  final containerVarItem =
                                                      containerVar[
                                                          containerVarIndex];
                                                  return V3fv0ritesWidget(
                                                    key: Key(
                                                        'Keyxwz_${containerVarIndex}_of_${containerVar.length}'),
                                                    profesionalId:
                                                        containerVarItem
                                                            .reference,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: FutureBuilder<List<UsersRecord>>(
                              future: queryUsersRecordOnce(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'rol',
                                  isEqualTo: Roles.user.serialize(),
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
                                List<UsersRecord>
                                    homeVistaCuidadorUsersRecordList =
                                    snapshot.data!;

                                return Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.5),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.94,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: wrapWithModel(
                                            model: _model.mapButtonModel2,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: const MapButtonWidget(
                                              isProfessional: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-0.9, 0.76),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.541,
                                          height: 220.0,
                                          decoration: const BoxDecoration(),
                                          child: wrapWithModel(
                                            model:
                                                _model.homeVistaCuidadorModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: HomeVistaCuidadorWidget(
                                              participants:
                                                  homeVistaCuidadorUsersRecordList
                                                      .where((e) => functions
                                                          .verifyDistanceFilter(
                                                              FFAppState()
                                                                  .newUbicationProfessional,
                                                              e.suburb!,
                                                              FFAppState()
                                                                  .zoomFilter))
                                                      .toList()
                                                      .length
                                                      .toString(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.01),
                  child: Container(
                    height: 73.0,
                    decoration: const BoxDecoration(
                      color: Color(0xD7B928B8),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        if (currentUserDocument?.rol != Roles.business) {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.navbarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavbarWidget(),
                            ),
                          );
                        } else {
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.navbarPremiunModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const NavbarPremiunWidget(),
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
      ),
    );
  }
}
