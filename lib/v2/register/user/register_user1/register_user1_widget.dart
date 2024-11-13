import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/user/mapbuscar/mapbuscar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'register_user1_model.dart';
export 'register_user1_model.dart';

class RegisterUser1Widget extends StatefulWidget {
  const RegisterUser1Widget({super.key});

  @override
  State<RegisterUser1Widget> createState() => _RegisterUser1WidgetState();
}

class _RegisterUser1WidgetState extends State<RegisterUser1Widget>
    with TickerProviderStateMixin {
  late RegisterUser1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterUser1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().updateRegisterProviderFormStruct(
        (e) => e
          ..serviceType = List.generate(
              random_data.randomInteger(5, 1),
              (index) => random_data.randomString(
                    0,
                    1,
                    true,
                    false,
                    false,
                  )).toList(),
      );
      safeSetState(() {});
    });

    _model.firstNameTextController ??=
        TextEditingController(text: _model.firstName);
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastnameTextController ??= TextEditingController();
    _model.lastnameFocusNode ??= FocusNode();

    _model.dateTextController ??= TextEditingController();
    _model.dateFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.emailCTextController ??= TextEditingController();
    _model.emailCFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController();
    _model.phoneFocusNode ??= FocusNode();

    _model.queryTextController ??= TextEditingController();
    _model.queryFocusNode ??= FocusNode();

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
      'textOnPageLoadAnimation4': AnimationInfo(
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
                                    'assets/images/logo-pegados.png',
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
                                    controller: _model.formC,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
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
                                                '2iqhtl98' /* Create Account */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'pintanga',
                                                    color: const Color(0xFF1D69D7),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: false,
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
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Container(
                                              width: 327.0,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF718CD4),
                                                border: Border.all(
                                                  color: const Color(0xFF718CD4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.84, -0.73),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'm647jg73' /* * First name */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
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
                                                key: const ValueKey('firstName'),
                                                controller: _model
                                                    .firstNameTextController,
                                                focusNode:
                                                    _model.firstNameFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.firstNameTextController',
                                                  const Duration(milliseconds: 100),
                                                  () async {
                                                    safeSetState(() {
                                                      _model.firstNameTextController
                                                              ?.text =
                                                          functions
                                                              .transformTextUpper(
                                                                  _model
                                                                      .firstNameTextController
                                                                      .text);
                                                      _model.firstNameTextController
                                                              ?.selection =
                                                          TextSelection.collapsed(
                                                              offset: _model
                                                                  .firstNameTextController!
                                                                  .text
                                                                  .length);
                                                    });
                                                  },
                                                ),
                                                autofocus: true,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  errorStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
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
                                                              'pintanga',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                maxLines: null,
                                                maxLength: 100,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.name,
                                                validator: _model
                                                    .firstNameTextControllerValidator
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
                                                    15.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wtdsy0s8' /* * Last name */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
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
                                                key: const ValueKey('lastName'),
                                                controller: _model
                                                    .lastnameTextController,
                                                focusNode:
                                                    _model.lastnameFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.lastnameTextController',
                                                  const Duration(milliseconds: 100),
                                                  () async {
                                                    safeSetState(() {
                                                      _model.lastnameTextController
                                                              ?.text =
                                                          functions
                                                              .transformTextUpper(
                                                                  _model
                                                                      .lastnameTextController
                                                                      .text);
                                                      _model.lastnameTextController
                                                              ?.selection =
                                                          TextSelection.collapsed(
                                                              offset: _model
                                                                  .lastnameTextController!
                                                                  .text
                                                                  .length);
                                                    });
                                                  },
                                                ),
                                                autofocus: true,
                                                textCapitalization:
                                                    TextCapitalization.words,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  errorStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
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
                                                              'pintanga',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                maxLines: null,
                                                maxLength: 100,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.name,
                                                validator: _model
                                                    .lastnameTextControllerValidator
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
                                                    15.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ir0by4gc' /* * Date of birth */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
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
                                                            -0.01, -0.69),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.8,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFFFFFEFE),
                                                        borderRadius:
                                                            BorderRadius.only(
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
                                                      ),
                                                      child: TextFormField(
                                                        key: const ValueKey('date'),
                                                        controller: _model
                                                            .dateTextController,
                                                        focusNode: _model
                                                            .dateFocusNode,
                                                        autofocus: true,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .none,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'pintanga',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'ecjf911m' /* DD/MM/YYYY */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'pintanga',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          errorStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'pintanga',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        false,
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
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              color:
                                                                  Colors.black,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        maxLines: null,
                                                        keyboardType:
                                                            TextInputType
                                                                .datetime,
                                                        validator: _model
                                                            .dateTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          _model.dateMask
                                                        ],
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
                                                                .date &&
                                                            (FFAppState()
                                                                    .counter >
                                                                2)) {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.72, 0.6),
                                                            child: Text(
                                                              key: const ValueKey(
                                                                  'dateError'),
                                                              _model.dateError,
                                                              maxLines: 2,
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
                                                                            .w500,
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
                                                              'f9r6x7ek' /*   */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'pintanga',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
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
                                                    15.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'trgoibj2' /* * Email address */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
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
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: TextFormField(
                                                    key: const ValueKey('email'),
                                                    controller: _model
                                                        .emailTextController,
                                                    focusNode:
                                                        _model.emailFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.emailTextController',
                                                      const Duration(
                                                          milliseconds: 10),
                                                      () async {
                                                        _model.emailExists =
                                                            await queryUsersRecordCount(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'email',
                                                            isEqualTo: _model
                                                                .emailTextController
                                                                .text,
                                                          ),
                                                        );

                                                        safeSetState(() {});
                                                      },
                                                    ),
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
                                                                    'pintanga',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'pintanga',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'pintanga',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0xFF1D69D7),
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0xFF1D69D7),
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLines: null,
                                                    maxLength: 100,
                                                    buildCounter: (context,
                                                            {required currentLength,
                                                            required isFocused,
                                                            maxLength}) =>
                                                        null,
                                                    validator: _model
                                                        .emailTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                if ((_model.emailExists !=
                                                        null) &&
                                                    (_model.emailExists! > 0))
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.8),
                                                    child: Text(
                                                      key: const ValueKey(
                                                          'emailVerify'),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'a5fwk8t2' /* This email already has an acco... */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'pintanga',
                                                            color: const Color(
                                                                0xFFFF5963),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation2']!),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.84, -0.73),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 0.0, 15.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6374m3tb' /*   * Confirm email address */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'pintanga',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
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
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: TextFormField(
                                                    key: const ValueKey('email'),
                                                    controller: _model
                                                        .emailCTextController,
                                                    focusNode:
                                                        _model.emailCFocusNode,
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
                                                                    'pintanga',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'pintanga',
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      errorStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'pintanga',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0xFF1D69D7),
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0xFF1D69D7),
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLines: null,
                                                    maxLength: 100,
                                                    buildCounter: (context,
                                                            {required currentLength,
                                                            required isFocused,
                                                            maxLength}) =>
                                                        null,
                                                    validator: _model
                                                        .emailCTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                if (FFAppState()
                                                        .verifyForm
                                                        .same1 ==
                                                    false)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.8, 0.9),
                                                    child: Text(
                                                      key: const ValueKey(
                                                          'emailVerify'),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6jzg633h' /* Email has to be the same */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'pintanga',
                                                            color: const Color(
                                                                0xFFFF5963),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'textOnPageLoadAnimation3']!),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.84, -0.73),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 15.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'y4chlyob' /* * Enter your phone number     ... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
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
                                            height: 80.0,
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
                                                key: const ValueKey('email'),
                                                controller:
                                                    _model.phoneTextController,
                                                focusNode:
                                                    _model.phoneFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '398i591j' /* Example (XXX) XXX-XXXX */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                  errorStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
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
                                                              'pintanga',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                maxLines: null,
                                                maxLength: 14,
                                                keyboardType:
                                                    TextInputType.phone,
                                                validator: _model
                                                    .phoneTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  _model.phoneMask
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
                                                    15.0, 0.0, 0.0, 15.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'p7bqj01f' /* * Select your suburb */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'pintanga',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
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
                                                                        .subur ==
                                                                    true
                                                                ? const Color(
                                                                    0xFF1D69D7)
                                                                : const Color(
                                                                    0xFFFF5963),
                                                            const Color(0xFF1D69D7),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          key:
                                                              const ValueKey('query'),
                                                          controller: _model
                                                              .queryTextController,
                                                          focusNode: _model
                                                              .queryFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.queryTextController',
                                                            const Duration(
                                                                milliseconds:
                                                                    100),
                                                            () async {
                                                              _model.apiResultuev =
                                                                  await GetSuggestionMapProfesionalCall
                                                                      .call(
                                                                query: _model
                                                                    .queryTextController
                                                                    .text,
                                                              );

                                                              if ((_model
                                                                      .apiResultuev
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.queryResults =
                                                                    GetSuggestionMapProfesionalCall
                                                                            .predictions(
                                                                  (_model.apiResultuev
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                        .toList()
                                                                        .cast<
                                                                            QueryResultsStruct>();
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'iayxow22' /* Select your suburb */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'pintanga',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                          validator: _model
                                                              .queryTextControllerValidator
                                                              .asValidator(
                                                                  context),
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
                                                                .subur &&
                                                            (FFAppState()
                                                                    .counter >
                                                                2)) {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.62, 0.7),
                                                            child: Text(
                                                              key: const ValueKey(
                                                                  'indalidSuburb'),
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'srwzpw4c' /* Invalid suburb */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'pintanga',
                                                                    color: const Color(
                                                                        0xFFFF5963),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation4']!),
                                                          );
                                                        } else {
                                                          return Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'af33qbcp' /*   */,
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
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Container(
                                              width: 327.0,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF718CD4),
                                                border: Border.all(
                                                  color: const Color(0xFF718CD4),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Container(
                                            width: 269.0,
                                            height: 93.0,
                                            decoration: const BoxDecoration(
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
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  key: const ValueKey('continue'),
                                                  onPressed: () async {
                                                    _model
                                                        .dateError = FFLocalizations
                                                                    .of(context)
                                                                .languageCode ==
                                                            'en'
                                                        ? 'Field is required'
                                                        : 'El campo es obligatorio';
                                                    FFAppState()
                                                        .updateVerifyFormStruct(
                                                      (e) => e
                                                        ..date = _model.dateTextController
                                                                    .text !=
                                                                ''
                                                        ..subur =
                                                            valueOrDefault<
                                                                bool>(
                                                          (_model.queryTextController
                                                                          .text !=
                                                                      '') &&
                                                              (_model.newUbication !=
                                                                      null &&
                                                                  _model.newUbication !=
                                                                      ''),
                                                          false,
                                                        )
                                                        ..same1 = _model
                                                                .emailTextController
                                                                .text ==
                                                            _model
                                                                .emailCTextController
                                                                .text,
                                                    );
                                                    FFAppState().counter = 4;
                                                    safeSetState(() {});
                                                    if (!functions.validateDate(
                                                        _model
                                                            .dateTextController
                                                            .text)!) {
                                                      _model
                                                          .dateError = FFLocalizations
                                                                      .of(context)
                                                                  .languageCode ==
                                                              'en'
                                                          ? 'Allowed age range: 18 to 125 years.'
                                                          : 'Rango de edad permitido: de 18 a 125 años.';
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .updateVerifyFormStruct(
                                                        (e) => e..date = false,
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                    if (!functions
                                                        .validateFormatDate(_model
                                                            .dateTextController
                                                            .text)) {
                                                      _model
                                                          .dateError = FFLocalizations
                                                                      .of(context)
                                                                  .languageCode ==
                                                              'en'
                                                          ? 'Enter day (1-31) and month (1-12).'
                                                          : 'Ingrese día (1-31) y mes (1-12).';
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .updateVerifyFormStruct(
                                                        (e) => e..date = false,
                                                      );
                                                      safeSetState(() {});
                                                    }
                                                    _model.formV = true;
                                                    if (_model.formKey
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      _model.formV = false;
                                                    }
                                                    FFAppState()
                                                        .updateVerifyFormStruct(
                                                      (e) => e
                                                        ..date = (functions
                                                                    .validateDate(_model
                                                                        .dateTextController
                                                                        .text) ==
                                                                true) &&
                                                            (functions.validateFormatDate(
                                                                    _model
                                                                        .dateTextController
                                                                        .text) ==
                                                                true),
                                                    );
                                                    safeSetState(() {});
                                                    if (FFAppState().verifyForm.subur &&
                                                        FFAppState()
                                                            .verifyForm
                                                            .date &&
                                                        FFAppState()
                                                            .verifyForm
                                                            .same1 &&
                                                        FFAppState()
                                                            .verifyForm
                                                            .date &&
                                                        _model.formV!) {
                                                      FFAppState().verifyForm =
                                                          FormVerifyStruct();
                                                      FFAppState().counter = 0;
                                                      FFAppState()
                                                          .updateRegisterProviderFormStruct(
                                                        (e) => e
                                                          ..firstName = _model
                                                              .firstNameTextController
                                                              .text
                                                          ..birthdate = functions
                                                              .convertStringToDate(
                                                                  _model
                                                                      .dateTextController
                                                                      .text)
                                                          ..phone = _model
                                                              .phoneTextController
                                                              .text
                                                          ..suburb = functions
                                                              .changeUbication(functions
                                                                  .stringToLatLng(
                                                                      _model
                                                                          .newUbication!))
                                                          ..plan = Plan.standar
                                                          ..lastName = _model
                                                              .lastnameTextController
                                                              .text
                                                          ..email = _model
                                                              .emailTextController
                                                              .text,
                                                      );

                                                      context.pushNamed(
                                                        'RegisterUser2',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    200),
                                                          ),
                                                        },
                                                      );
                                                    } else {
                                                      await _model.formC
                                                          ?.animateTo(
                                                        0,
                                                        duration: const Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'bmrgrcxv' /* Continue */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 275.0,
                                                    height: 45.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: const Color(0xFF4963C9),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'pintanga',
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                    elevation: 5.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
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
                            ),
                            if (_model.queryResults.isNotEmpty)
                              Align(
                                alignment: const AlignmentDirectional(0.0, -0.9),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.96,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.648,
                                  decoration: BoxDecoration(
                                    color: const Color(0x33000000),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  child: SingleChildScrollView(
                                    controller: _model.columnController,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final newquery =
                                                  _model.queryResults.toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: newquery.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 0.0),
                                                itemBuilder:
                                                    (context, newqueryIndex) {
                                                  final newqueryItem =
                                                      newquery[newqueryIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.newPlace =
                                                          await GetPlaceCall
                                                              .call(
                                                        placeId: newqueryItem
                                                            .placeId,
                                                      );

                                                      if ((_model.newPlace
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.newUbication = functions
                                                            .concatStrings(
                                                                GetPlaceCall
                                                                        .location(
                                                                  (_model.newPlace
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                                    ?.lat
                                                                    .toString(),
                                                                GetPlaceCall
                                                                    .location(
                                                                  (_model.newPlace
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.lng.toString(),
                                                                ',');
                                                        safeSetState(() {
                                                          _model.queryTextController
                                                                  ?.text =
                                                              GetPlaceCall.name(
                                                            (_model.newPlace
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!;
                                                          _model.queryTextController
                                                                  ?.selection =
                                                              TextSelection.collapsed(
                                                                  offset: _model
                                                                      .queryTextController!
                                                                      .text
                                                                      .length);
                                                        });
                                                      }
                                                      _model.queryResults = [];

                                                      safeSetState(() {});
                                                    },
                                                    child: MapbuscarWidget(
                                                      key: Key(
                                                          'Keygju_${newqueryIndex}_of_${newquery.length}'),
                                                      icon: const Icon(
                                                        key: ValueKey('search'),
                                                        Icons.location_on,
                                                        color:
                                                            Color(0xFFD26AD2),
                                                      ),
                                                      text: newqueryItem
                                                          .description,
                                                    ),
                                                  );
                                                },
                                                controller:
                                                    _model.listViewController,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
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
