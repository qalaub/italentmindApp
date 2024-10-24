import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'cadari0_model.dart';
export 'cadari0_model.dart';

class Cadari0Widget extends StatefulWidget {
  const Cadari0Widget({
    super.key,
    this.bussinesRef,
  });

  final DocumentReference? bussinesRef;

  @override
  State<Cadari0Widget> createState() => _Cadari0WidgetState();
}

class _Cadari0WidgetState extends State<Cadari0Widget> {
  late Cadari0Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cadari0Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/fondo-inicio.png',
                  ).image,
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 200.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.96,
                            height: 384.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                              ),
                              border: Border.all(
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2qw6woik' /* Select work days */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 19.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const Divider(
                                  height: 23.0,
                                  thickness: 2.0,
                                  color: Color(0xFF4963C9),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: FlutterFlowCheckboxGroup(
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9hy7meui' /* Monday */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'i3e714zc' /* Tuesday */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'l5hvk66b' /* Wednesday */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1w5uvjhn' /* Thursday */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ytb4vz7u' /* Friday */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'atcdek5p' /* Saturday */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qxzdps64' /* Sunday */,
                                              )
                                            ],
                                            onChanged: (val) => safeSetState(
                                                () => _model
                                                    .checkboxGroupValues = val),
                                            controller: _model
                                                    .checkboxGroupValueController ??=
                                                FormFieldController<
                                                    List<String>>(
                                              List.from([
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'rcehxi7g' /* Monday */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'n8l6e8uy' /* Tuesday */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'niogyk4n' /* Wednesday */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '5pfbnjw8' /* Thursday */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '88119xh3' /* Friday */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ypirayh1' /* Saturday */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'rvfian52' /* Sunday */,
                                                    )
                                                  ] ??
                                                  []),
                                            ),
                                            activeColor: const Color(0xFF1D69D7),
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            checkboxBorderColor:
                                                const Color(0xFF090909),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            unselectedTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: const Color(0xFF050505),
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            checkboxBorderRadius:
                                                BorderRadius.circular(4.0),
                                            initialized:
                                                _model.checkboxGroupValues !=
                                                    null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 16.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState()
                                          .updateRegisterProviderFormStruct(
                                        (e) => e
                                          ..schedule = _model
                                              .checkboxGroupValues!
                                              .toList(),
                                      );
                                      safeSetState(() {});
                                      if (_model.checkboxGroupValues!.isNotEmpty) {
                                        context.pushNamed(
                                          'RegisterPfofesional4',
                                          queryParameters: {
                                            'businessRef': serializeParam(
                                              widget.bussinesRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              FFLocalizations.of(context)
                                                          .languageCode ==
                                                      'en'
                                                  ? 'You must select at least one day'
                                                  : 'Debes seleccionar al menos un día',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor: const Color(0xFF4963C9),
                                          ),
                                        );
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'rv2w3vi2' /* Continue */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 279.0,
                                      height: 45.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF4963C9),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/logo-italente_sinfondo-negro.png',
                          width: 180.0,
                          height: 110.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.91, -0.96),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
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
