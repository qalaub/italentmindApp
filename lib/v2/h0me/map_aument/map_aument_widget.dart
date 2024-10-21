import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/h0me/map_button/map_button_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'map_aument_model.dart';
export 'map_aument_model.dart';

class MapAumentWidget extends StatefulWidget {
  const MapAumentWidget({
    super.key,
    this.currentLatLng,
    bool? authUser,
  }) : authUser = authUser ?? true;

  final List<LatLng>? currentLatLng;
  final bool authUser;

  @override
  State<MapAumentWidget> createState() => _MapAumentWidgetState();
}

class _MapAumentWidgetState extends State<MapAumentWidget> {
  late MapAumentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapAumentModel());

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
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 0) <
                getCurrentTimestamp.secondsSinceEpoch) {
              await currentUserReference!.update(createUsersRecordData(
                freeTrial: false,
                paymentDate: getCurrentTimestamp,
              ));
            }
          } else {
            if (functions.addDays(
                    currentUserDocument!.paymentDate!.secondsSinceEpoch, 1) <
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
      child: WillPopScope(
        onWillPop: () async => false,
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
                      height: MediaQuery.sizeOf(context).height * 0.865,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: wrapWithModel(
                        model: _model.mapButtonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const MapButtonWidget(),
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
      ),
    );
  }
}
