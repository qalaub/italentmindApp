import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'home_vista_cuidador_model.dart';
export 'home_vista_cuidador_model.dart';

class HomeVistaCuidadorWidget extends StatefulWidget {
  const HomeVistaCuidadorWidget({
    super.key,
    String? participants,
  }) : participants = participants ?? '35 participants';

  final String participants;

  @override
  State<HomeVistaCuidadorWidget> createState() =>
      _HomeVistaCuidadorWidgetState();
}

class _HomeVistaCuidadorWidgetState extends State<HomeVistaCuidadorWidget> {
  late HomeVistaCuidadorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeVistaCuidadorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, -0.1),
          child: Material(
            color: Colors.transparent,
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Container(
              width: 344.0,
              height: 230.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: Image.asset(
                    'assets/images/Group_97_(3).png',
                  ).image,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 9.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '3xvbswtx' /* There are   */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'ITC Bauhaus fuente',
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black,
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 1.0,
                                        ),
                                        const Shadow(
                                          color: Colors.black,
                                          offset: Offset(0.0, -2.0),
                                          blurRadius: 0.0,
                                        )
                                      ],
                                      useGoogleFonts: false,
                                    ),
                              ),
                              Text(
                                widget.participants,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'ITC Bauhaus fuente',
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        const Shadow(
                                          color: Colors.black,
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 1.0,
                                        ),
                                        const Shadow(
                                          color: Colors.black,
                                          offset: Offset(0.0, -2.0),
                                          blurRadius: 0.0,
                                        )
                                      ],
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'd4c9r5af' /* NDIS Participants 
near your  */
                                ,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'ITC Bauhaus fuente',
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      const Shadow(
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 1.0,
                                      ),
                                      const Shadow(
                                        color: Colors.black,
                                        offset: Offset(0.0, -2.0),
                                        blurRadius: 0.0,
                                      )
                                    ],
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 1.0))
                        .addToStart(const SizedBox(height: 48.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
