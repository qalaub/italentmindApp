import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'register_professional3_widget.dart' show RegisterProfessional3Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterProfessional3Model
    extends FlutterFlowModel<RegisterProfessional3Widget> {
  ///  Local state fields for this page.

  bool isCompany = false;

  DocumentReference? bussinesRef;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for question widget.
  FormFieldController<String>? questionValueController;
  // State field(s) for company widget.
  String? companyValue;
  FormFieldController<String>? companyValueController;
  // State field(s) for code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CodesRecord? business;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? newBusi;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codeFocusNode?.dispose();
    codeTextController?.dispose();
  }

  /// Additional helper methods.
  String? get questionValue => questionValueController?.value;
}
