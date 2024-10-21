import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'register_business2_widget.dart' show RegisterBusiness2Widget;
import 'package:flutter/material.dart';

class RegisterBusiness2Model extends FlutterFlowModel<RegisterBusiness2Widget> {
  ///  Local state fields for this page.

  bool isNDIS = false;

  bool termsAccept = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for serviceType widget.
  List<String>? serviceTypeValue;
  FormFieldController<List<String>>? serviceTypeValueController;
  // State field(s) for ndisselect widget.
  String? ndisselectValue;
  FormFieldController<String>? ndisselectValueController;
  // State field(s) for ndis widget.
  FocusNode? ndisFocusNode;
  TextEditingController? ndisTextController;
  String? Function(BuildContext, String?)? ndisTextControllerValidator;
  // State field(s) for age widget.
  String? ageValue;
  FormFieldController<String>? ageValueController;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o8aome6s' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    if (!RegExp(
            '^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])(?=.*[a-z])\\S{8,50}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'wt22ng1j' /* Password: 8+ charts, e.g., Abc... */,
      );
    }
    return null;
  }

  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  String? _confirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rdt6nbx9' /* Field is required */,
      );
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    if (!RegExp(
            '^(?=.*\\d)(?=.*[\\u0021-\\u002b\\u003c-\\u0040])(?=.*[A-Z])(?=.*[a-z])\\S{8,50}\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'yk69e1rk' /* Password: 8+ charts, e.g., Abc... */,
      );
    }
    return null;
  }

  // State field(s) for terms widget.
  bool? termsValue;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    confirmPasswordVisibility = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    ndisFocusNode?.dispose();
    ndisTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
