import '/flutter_flow/flutter_flow_util.dart';
import 'mensage_tinder_widget.dart' show MensageTinderWidget;
import 'package:flutter/material.dart';

class MensageTinderModel extends FlutterFlowModel<MensageTinderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
