import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'cuestionario_model.dart';
export 'cuestionario_model.dart';

class CuestionarioWidget extends StatefulWidget {
  const CuestionarioWidget({super.key});

  @override
  State<CuestionarioWidget> createState() => _CuestionarioWidgetState();
}

class _CuestionarioWidgetState extends State<CuestionarioWidget> {
  late CuestionarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CuestionarioModel());
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
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/fondo-inicio.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.91, -1.06),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/logo-italente_sinfondo-negro.png',
                            width: 180.0,
                            height: 110.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 120.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.96,
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFEFE),
                            borderRadius: BorderRadius.circular(16.0),
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
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'odr2f45r' /* Find Your Membership */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
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
                                  const SizedBox(
                                    width: 340.0,
                                    child: Divider(
                                      height: 20.0,
                                      thickness: 2.0,
                                      color: Color(0xFFF0DFEF),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 16.0, 8.0, 4.0),
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kmmdrzk7' /* * Do you need instant messagin... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.firts = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'k2cu0c4n' /* Yes */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.firts
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.firts
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.firts = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '1nj10c7u' /* No */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.firts
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.firts
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 4.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'za0mm7rw' /* * Do you require detailed map ... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.second = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'enzi3y6i' /* Yes */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.second
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.second
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.second = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'i1hm57a0' /* No */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.second
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.second
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 4.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'as2gptpv' /* * Do you need to create detail... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.tree = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'u6k7m7tl' /* Yes */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.tree
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.tree
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.tree = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'hek1v9lo' /* No */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.tree
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.tree
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.86,
                                    height: 184.0,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 16.0, 8.0, 4.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2zbdcuw1' /* * Do you require enhanced sear... */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.four = true;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'frigsuts' /* Yes */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.four
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: _model.four
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.four = false;
                                            _model.showSugguestions = true;
                                            _model.suguestion =
                                                functions.suguestionPlan(
                                                    _model.firts,
                                                    _model.second,
                                                    _model.tree,
                                                    _model.four);
                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'rom23jvu' /* No */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: !_model.four
                                                ? const Color(0xFF1D69D7)
                                                : const Color(0xF0FFFFFF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: !_model.four
                                                          ? Colors.white
                                                          : Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF565454),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                  ),
                                  const Divider(
                                    height: 32.0,
                                    thickness: 1.0,
                                    indent: 12.0,
                                    endIndent: 12.0,
                                    color: Color(0xD8BDB8B8),
                                  ),
                                  if (_model.showSugguestions)
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.suguestion == 'Basic') {
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.86,
                                              height: 230.0,
                                              constraints: const BoxConstraints(
                                                minHeight: 230.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0x9ED7AE71),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '11pthoc7' /* Recommended Plan */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                's4v8eh57' /* Based on your answers, we reco... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'y45s3saf' /*  Basic */,
                                                              ),
                                                              style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 15.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'h6wvrndf' /*   plan. */,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '96e0uyxq' /* The Premium plan includes: */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'e82w1tm2' /* • Instant messaging for your t... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'a2h1884j' /* 
• Detailed map features to lo... */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'e1e0cjph' /* 
• Customizable team profiles */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'omp6fk3x' /* 
• Enhanced search visibility ... */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else if (_model.suguestion ==
                                              'Standar') {
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.86,
                                              height: 230.0,
                                              constraints: const BoxConstraints(
                                                minHeight: 230.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xE3E6E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '2wtpck8h' /* Recommended Plan */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'qj8glsap' /* Based on your answers, we reco... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '5l8cbxjy' /*  Standar */,
                                                              ),
                                                              style: const TextStyle(
                                                                color: Color(
                                                                    0xFF767676),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 15.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '28mt6gpb' /*  plan. */,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'az3uhu6n' /* The Premium plan includes: */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '2b5373wv' /* • Instant messaging for your t... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'jvjcheen' /* 
• Detailed map features to lo... */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '9qtk8zu5' /* 
• Customizable team profiles */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '3oy4cnuc' /* 
• Enhanced search visibility ... */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.86,
                                              height: 230.0,
                                              constraints: const BoxConstraints(
                                                minHeight: 230.0,
                                              ),
                                              decoration: BoxDecoration(
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Color(0xACF9CB4A),
                                                    Color(0xA393782B)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'o1ei6x6q' /* Recommended Plan */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '8eax5b8v' /* Based on your answers, we reco... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'rajr4igr' /*  Premium */,
                                                              ),
                                                              style: const TextStyle(
                                                                color: Color(
                                                                    0xFF93782B),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 15.0,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '7o84rm6d' /*  plan. */,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 8.0,
                                                                16.0, 8.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'tpk3bvld' /* The Premium plan includes: */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'k109xm4v' /* • Instant messaging for your t... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'l4q4czd4' /* 
• Detailed map features to lo... */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'fwhldbmf' /* 
• Customizable team profiles */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '2pf4y776' /* 
• Enhanced search visibility ... */
                                                                ,
                                                              ),
                                                              style:
                                                                  const TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed('MembresiasV2');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '8ha4o8or' /* Choose Membership */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 45.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.white,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.black,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Color(0xFF7A7777),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.suguestion ==
                                                'Premiun') {
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e..plan = Plan.premiun,
                                              );

                                              context.pushNamed(
                                                  'RegisterBusiness1');
                                            } else if (_model.suguestion ==
                                                'Standar') {
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e..plan = Plan.standar,
                                              );

                                              context.pushNamed(
                                                  'RegisterProfessional1');
                                            } else {
                                              FFAppState()
                                                  .updateRegisterProviderFormStruct(
                                                (e) => e..plan = Plan.basic,
                                              );

                                              context.pushNamed(
                                                  'RegisterProfessional1');
                                            }
                                          },
                                          text: _model.suguestion != ''
                                              ? functions.concatStrings(
                                                  'Select',
                                                  functions.concatStrings(
                                                      _model.suguestion,
                                                      'Plan',
                                                      ' '),
                                                  ' ')!
                                              : 'Select Premium Plan',
                                          options: FFButtonOptions(
                                            width: 150.0,
                                            height: 45.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF4963C9),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ].addToEnd(const SizedBox(height: 32.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ].addToEnd(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
