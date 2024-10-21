import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'register_business3_widget.dart' show RegisterBusiness3Widget;
import 'package:flutter/material.dart';

class RegisterBusiness3Model extends FlutterFlowModel<RegisterBusiness3Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for years widget.
  FocusNode? yearsFocusNode;
  TextEditingController? yearsTextController;
  String? Function(BuildContext, String?)? yearsTextControllerValidator;
  String? _yearsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lvgj7iu7' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for disabilities widget.
  FocusNode? disabilitiesFocusNode;
  TextEditingController? disabilitiesTextController;
  String? Function(BuildContext, String?)? disabilitiesTextControllerValidator;
  String? _disabilitiesTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n4ostk4r' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    yearsTextControllerValidator = _yearsTextControllerValidator;
    disabilitiesTextControllerValidator = _disabilitiesTextControllerValidator;
  }

  @override
  void dispose() {
    yearsFocusNode?.dispose();
    yearsTextController?.dispose();

    disabilitiesFocusNode?.dispose();
    disabilitiesTextController?.dispose();
  }
}
