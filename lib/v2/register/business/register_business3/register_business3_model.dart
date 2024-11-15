import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'register_business3_widget.dart' show RegisterBusiness3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
