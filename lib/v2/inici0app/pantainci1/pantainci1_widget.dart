import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'pantainci1_model.dart';
export 'pantainci1_model.dart';

class Pantainci1Widget extends StatefulWidget {
  const Pantainci1Widget({super.key});

  @override
  State<Pantainci1Widget> createState() => _Pantainci1WidgetState();
}

class _Pantainci1WidgetState extends State<Pantainci1Widget> {
  late Pantainci1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Pantainci1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().showTutorial) {
        context.goNamed('tinderv2C1');
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: Stack(
                          children: [
                            PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (FFLocalizations.of(context)
                                            .languageCode ==
                                        'en') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/inicio_1-1.png',
                                          width: 300.0,
                                          height: 239.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/inicio1-es.png',
                                          width: 300.0,
                                          height: 239.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    if (FFLocalizations.of(context)
                                            .languageCode ==
                                        'en') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/inicio_1-3_(2).png',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/inicio_1-3_(4).png',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    if (FFLocalizations.of(context)
                                            .languageCode ==
                                        'en') {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/inicio_1-2.png',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/inicio2-es.png',
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.8),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 83.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  count: 3,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    safeSetState(() {});
                                  },
                                  effect: const smooth_page_indicator.SlideEffect(
                                    spacing: 8.0,
                                    radius: 1313131.0,
                                    dotWidth: 16.0,
                                    dotHeight: 16.0,
                                    dotColor: Color(0x4CFFFFFF),
                                    activeDotColor: Color(0xFF4963C9),
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.7),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                visualDensity: VisualDensity.compact,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              unselectedWidgetColor: const Color(0xFF26343E),
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= false,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.checkboxValue = newValue!);
                              },
                              side: const BorderSide(
                                width: 2,
                                color: Color(0xFF26343E),
                              ),
                              activeColor: const Color(0xFF243163),
                              checkColor: FlutterFlowTheme.of(context).info,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'ryp1ywwv' /* Skip this screen next time */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.01, 0.9),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.pageViewCurrentIndex < 2) {
                              await _model.pageViewController?.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            } else {
                              if (_model.checkboxValue == true) {
                                FFAppState().showTutorial = false;
                              } else {
                                FFAppState().showTutorial = true;
                              }

                              context.pushNamed('tinderv2C1');
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            'ls2neb7x' /* Continue */,
                          ),
                          options: FFButtonOptions(
                            width: 275.0,
                            height: 45.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4963C9),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 5.0,
                            borderSide: const BorderSide(
                              color: Color(0xFF243163),
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
            ],
          ),
        ),
      ),
    );
  }
}
