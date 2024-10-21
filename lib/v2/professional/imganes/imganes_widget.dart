import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'imganes_model.dart';
export 'imganes_model.dart';

class ImganesWidget extends StatefulWidget {
  const ImganesWidget({
    super.key,
    required this.professional,
  });

  final List<String>? professional;

  @override
  State<ImganesWidget> createState() => _ImganesWidgetState();
}

class _ImganesWidgetState extends State<ImganesWidget> {
  late ImganesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImganesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 314.0,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.96,
          maxHeight: MediaQuery.sizeOf(context).height * 0.6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
        ),
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Builder(
                builder: (context) {
                  final imgs = widget.professional!.toList();

                  return SizedBox(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage: max(0, min(0, imgs.length - 1))),
                          scrollDirection: Axis.horizontal,
                          itemCount: imgs.length,
                          itemBuilder: (context, imgsIndex) {
                            final imgsItem = imgs[imgsIndex];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.network(
                                valueOrDefault<String>(
                                  imgsItem,
                                  'https://picsum.photos/seed/96/600',
                                ),
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.754,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          max(0, min(0, imgs.length - 1))),
                              count: imgs.length,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                safeSetState(() {});
                              },
                              effect: const smooth_page_indicator.SlideEffect(
                                spacing: 8.0,
                                radius: 8.0,
                                dotWidth: 25.0,
                                dotHeight: 6.0,
                                dotColor: Color(0x4CFFFFFF),
                                activeDotColor: Color(0xFFBF079C),
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
