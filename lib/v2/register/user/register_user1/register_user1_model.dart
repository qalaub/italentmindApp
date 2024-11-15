import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/user/mapbuscar/mapbuscar_widget.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'register_user1_widget.dart' show RegisterUser1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class RegisterUser1Model extends FlutterFlowModel<RegisterUser1Widget> {
  ///  Local state fields for this page.

  String? newUbication;

  List<QueryResultsStruct> queryResults = [];
  void addToQueryResults(QueryResultsStruct item) => queryResults.add(item);
  void removeFromQueryResults(QueryResultsStruct item) =>
      queryResults.remove(item);
  void removeAtIndexFromQueryResults(int index) => queryResults.removeAt(index);
  void insertAtIndexInQueryResults(int index, QueryResultsStruct item) =>
      queryResults.insert(index, item);
  void updateQueryResultsAtIndex(
          int index, Function(QueryResultsStruct) updateFn) =>
      queryResults[index] = updateFn(queryResults[index]);

  String dateError = 'Field is required';

  String? firstName;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for formC widget.
  ScrollController? formC;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'odyckplf' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?!.*\\b(?:[Uu]suario|[Pp]erfil)\\b)[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\\s]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'o6oxssdc' /* Please enter a valid name. Spe... */,
      );
    }
    return null;
  }

  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
  String? _lastnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't0x8upzg' /* Field is required */,
      );
    }

    if (!RegExp(
            '^(?!.*\\b(?:[Uu]suario|[Pp]erfil)\\b)[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\\s]+\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'vxs56bma' /* Please enter a valid name. Spe... */,
      );
    }
    return null;
  }

  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  final dateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '33ukxv9t' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '3zqno7cv' /* Please enter a valid e-mail ad... */,
      );
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in email widget.
  int? emailExists;
  // State field(s) for emailC widget.
  FocusNode? emailCFocusNode;
  TextEditingController? emailCTextController;
  String? Function(BuildContext, String?)? emailCTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  final phoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bv81mrlb' /* Field is required */,
      );
    }

    if (val.length < 14) {
      return 'Requires at least 14 characters.';
    }
    if (val.length > 14) {
      return 'Maximum 14 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for query widget.
  FocusNode? queryFocusNode;
  TextEditingController? queryTextController;
  String? Function(BuildContext, String?)? queryTextControllerValidator;
  // Stores action output result for [Backend Call - API (getSuggestionMapProfesional)] action in query widget.
  ApiCallResponse? apiResultuev;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formV;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (getPlace)] action in mapbuscar widget.
  ApiCallResponse? newPlace;

  @override
  void initState(BuildContext context) {
    formC = ScrollController();
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastnameTextControllerValidator = _lastnameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    formC?.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    emailCFocusNode?.dispose();
    emailCTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    queryFocusNode?.dispose();
    queryTextController?.dispose();

    columnController?.dispose();
    listViewController?.dispose();
  }
}
