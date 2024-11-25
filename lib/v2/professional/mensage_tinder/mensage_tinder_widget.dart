import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mensage_tinder_model.dart';
export 'mensage_tinder_model.dart';

class MensageTinderWidget extends StatefulWidget {
  const MensageTinderWidget({super.key});

  @override
  State<MensageTinderWidget> createState() => _MensageTinderWidgetState();
}

class _MensageTinderWidgetState extends State<MensageTinderWidget> {
  late MensageTinderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensageTinderModel());
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
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
                    color: const Color(0x0AECDADE),
                    width: 3.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 500.0,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Builder(
                              builder: (context) {
                                if (FFLocalizations.of(context).languageCode ==
                                    'en') {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/favorites_(1).png',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                } else {
                                  return ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/favorites-esp.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ].divide(const SizedBox(height: 16.0)),
      ),
    );
  }
}
