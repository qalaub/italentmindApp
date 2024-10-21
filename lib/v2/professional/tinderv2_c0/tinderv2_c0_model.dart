import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'tinderv2_c0_widget.dart' show Tinderv2C0Widget;
import 'package:flutter/material.dart';

class Tinderv2C0Model extends FlutterFlowModel<Tinderv2C0Widget> {
  ///  Local state fields for this component.

  String newSuburb = 'location';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getNamePlace)] action in tinderv2C0 widget.
  ApiCallResponse? apiResultipr;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for MembresiaLogo component.
  late MembresiaLogoModel membresiaLogoModel;

  @override
  void initState(BuildContext context) {
    membresiaLogoModel = createModel(context, () => MembresiaLogoModel());
  }

  @override
  void dispose() {
    membresiaLogoModel.dispose();
  }
}
