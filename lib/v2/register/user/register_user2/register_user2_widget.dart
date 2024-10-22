import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'register_user2_model.dart';
export 'register_user2_model.dart';

class RegisterUser2Widget extends StatefulWidget {
  const RegisterUser2Widget({super.key});

  @override
  State<RegisterUser2Widget> createState() => _RegisterUser2WidgetState();
}

class _RegisterUser2WidgetState extends State<RegisterUser2Widget>
    with TickerProviderStateMixin {
  late RegisterUser2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterUser2Model());

    _model.ndisTextController ??= TextEditingController();
    _model.ndisFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmPasswordTextController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -11.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -11.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -11.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: const Color(0xFFFFFEFE),
            automaticallyImplyLeading: false,
            actions: const [],
            centerTitle: false,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/fondo-inicio.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-0.91, -0.96),
                              child: FlutterFlowIconButton(
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
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/logo-italente_sinfondo-negro.png',
                                    width: 180.0,
                                    height: 100.0,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.3),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFEFE),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(24.0),
                                    bottomRight: Radius.circular(24.0),
                                    topLeft: Radius.circular(24.0),
                                    topRight: Radius.circular(24.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '72td12is' /* Create Account */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: const Color(0xFF1D69D7),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 327.0,
                                            height: 1.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF718CD4),
                                              border: Border.all(
                                                color: const Color(0xFFF0DFEF),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.84, -0.73),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vauixge8' /* NDIS participant number */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.01, -0.69),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: 70.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFFFFEFE),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(12.0),
                                                bottomRight:
                                                    Radius.circular(12.0),
                                                topLeft: Radius.circular(12.0),
                                                topRight: Radius.circular(12.0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: TextFormField(
                                                key: const ValueKey('ndis'),
                                                controller:
                                                    _model.ndisTextController,
                                                focusNode: _model.ndisFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'df977wen' /* Enter your NDIS  (XXXXXXXXX) */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0.0,
                                                          ),
                                                  errorStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFF1D69D7),
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFF1D69D7),
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLines: null,
                                                maxLength: 15,
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .ndisTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.84, -0.73),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'stcd2q6r' /* * Type of disability */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Stack(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.8,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  12.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                        border: Border.all(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            FFAppState()
                                                                        .verifyForm
                                                                        .dropdown ==
                                                                    true
                                                                ? const Color(
                                                                    0xFF1D69D7)
                                                                : const Color(
                                                                    0xFFFF5963),
                                                            const Color(0xFF1D69D7),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          key: const ValueKey(
                                                              'disability'),
                                                          multiSelectController: _model
                                                                  .dropDownValueController ??=
                                                              FormListFieldController<
                                                                  String>(null),
                                                          options: [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'ezzeaa18' /* Autism */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'yj71a9tb' /* Behavioural
Early Intervention */
                                                              ,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'beyrba68' /* Chronic Medical Conditions */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'at8pks6o' /* Hearing Loss */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'djcup6o5' /* Intellectual/Development */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'omaxu7zb' /* Neurological  */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'brcjky0b' /* Physical  */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'v5qqg86z' /* Psychosocial/Mental Health */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'i72380gs' /* Vision Impairment  */,
                                                            )
                                                          ],
                                                          width: 261.0,
                                                          height: 56.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Colors
                                                                        .black,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'n4k1lf5s' /* Type of disability */,
                                                          ),
                                                          icon: const Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: Colors.black,
                                                            size: 24.0,
                                                          ),
                                                          fillColor:
                                                              Colors.white,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              const EdgeInsets.all(
                                                                  0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: true,
                                                          isSearchable: false,
                                                          isMultiSelect: true,
                                                          onMultiSelectChanged:
                                                              (val) => safeSetState(
                                                                  () => _model
                                                                          .dropDownValue =
                                                                      val),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (!FFAppState()
                                                                .verifyForm
                                                                .dropdown &&
                                                            (FFAppState()
                                                                    .counter >
                                                                2)) {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.62, 0.7),
                                                            child: Text(
                                                              key: const ValueKey(
                                                                  'disabilityRequired'),
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'ir059jk3' /* Field is required */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: const Color(
                                                                        0xFFFF5963),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation1']!),
                                                          );
                                                        } else {
                                                          return Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'tvq02gxq' /*   */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.84, -0.73),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'doorbb0o' /* * Password */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Stack(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: TextFormField(
                                                      key: const ValueKey('password'),
                                                      controller: _model
                                                          .passwordTextController,
                                                      focusNode: _model
                                                          .passwordFocusNode,
                                                      autofocus: true,
                                                      obscureText: !_model
                                                          .passwordVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '89nps03s' /* Example:  Carlos123@ */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0xFF1D69D7),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0xFF1D69D7),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        suffixIcon: InkWell(
                                                          onTap: () =>
                                                              safeSetState(
                                                            () => _model
                                                                    .passwordVisibility =
                                                                !_model
                                                                    .passwordVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.passwordVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: const Color(
                                                                0xFF6D6D6D),
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model
                                                          .passwordTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (!valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                  .verifyForm
                                                                  .same,
                                                              true,
                                                            ) &&
                                                            (FFAppState()
                                                                    .counter >
                                                                2)) {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.82, 0.5),
                                                            child: Text(
                                                              key: const ValueKey(
                                                                  'passwordVerify'),
                                                              !FFAppState()
                                                                          .verifyForm
                                                                          .same &&
                                                                      (functions.verifyCorrectPassword(_model
                                                                              .passwordTextController
                                                                              .text) ==
                                                                          true)
                                                                  ? 'Password has to be the same'
                                                                  : ' ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: const Color(
                                                                        0xFFFF5963),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation2']!),
                                                          );
                                                        } else {
                                                          return Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '7snfssac' /*   */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.84, -0.73),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mvgiizta' /* * Password has to be the same */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            height: 90.0,
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Stack(
                                                alignment: const AlignmentDirectional(
                                                    0.0, -1.0),
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: TextFormField(
                                                      key: const ValueKey(
                                                          'confirmPassword'),
                                                      controller: _model
                                                          .confirmPasswordTextController,
                                                      focusNode: _model
                                                          .confirmPasswordFocusNode,
                                                      autofocus: true,
                                                      obscureText: !_model
                                                          .confirmPasswordVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'sx0dmy8s' /* Example:  Carlos123@ */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  lineHeight:
                                                                      1.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0xFF1D69D7),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Color(
                                                                0xFF1D69D7),
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        suffixIcon: InkWell(
                                                          onTap: () =>
                                                              safeSetState(
                                                            () => _model
                                                                    .confirmPasswordVisibility =
                                                                !_model
                                                                    .confirmPasswordVisibility,
                                                          ),
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.confirmPasswordVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: const Color(
                                                                0xFF6D6D6D),
                                                            size: 18.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model
                                                          .confirmPasswordTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (!valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                  .verifyForm
                                                                  .same,
                                                              true,
                                                            ) &&
                                                            (FFAppState()
                                                                    .counter >
                                                                2)) {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.82, 0.6),
                                                            child: Text(
                                                              key: const ValueKey(
                                                                  'confirmPasswordVerify'),
                                                              !FFAppState()
                                                                          .verifyForm
                                                                          .same &&
                                                                      (functions.verifyCorrectPassword(_model
                                                                              .confirmPasswordTextController
                                                                              .text) ==
                                                                          true)
                                                                  ? 'Password has to be the same'
                                                                  : ' ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: const Color(
                                                                        0xFFFF5963),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation3']!),
                                                          );
                                                        } else {
                                                          return Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'brz6x6xt' /*   */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Container(
                                              width: 327.0,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF718CD4),
                                                border: Border.all(
                                                  color: const Color(0xFFF0DFEF),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: FFButtonWidget(
                                            key: const ValueKey('create'),
                                            onPressed: () async {
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              if (_model.dropDownValue ==
                                                  null) {
                                                return;
                                              }
                                              FFAppState()
                                                  .updateVerifyFormStruct(
                                                (e) => e
                                                  ..dropdown = _model
                                                          .dropDownValue!.isNotEmpty
                                                  ..confirm1 = _model.passwordTextController
                                                              .text !=
                                                          ''
                                                  ..confirm2 = _model.confirmPasswordTextController
                                                              .text !=
                                                          ''
                                                  ..same = _model
                                                          .passwordTextController
                                                          .text ==
                                                      _model
                                                          .confirmPasswordTextController
                                                          .text,
                                              );
                                              FFAppState().counter = 4;
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e
                                                  ..password = _model
                                                      .passwordTextController
                                                      .text
                                                  ..ndis = valueOrDefault(
                                                      currentUserDocument?.ndis,
                                                      '')
                                                  ..disabilities = _model
                                                      .dropDownValue!
                                                      .toList(),
                                              );
                                              if (FFAppState()
                                                      .verifyForm
                                                      .same ==
                                                  true) {
                                                FFAppState().verifyForm =
                                                    FormVerifyStruct();
                                                FFAppState().counter = 0;
                                                FFAppState()
                                                    .updateRegisterProviderFormStruct(
                                                  (e) => e..rol = Roles.user,
                                                );

                                                context.pushNamed(
                                                  'avatars',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 200),
                                                    ),
                                                  },
                                                );
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'rc64jtxn' /* Create */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 275.0,
                                              height: 45.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFF4963C9),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
