import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/user/account_option/account_option_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'userprofile_widget.dart' show UserprofileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserprofileModel extends FlutterFlowModel<UserprofileWidget> {
  ///  Local state fields for this page.

  String? code;

  bool showLanguagues = false;

  ///  State fields for stateful widgets in this page.

  // Model for AccountOption component.
  late AccountOptionModel accountOptionModel1;
  // Model for AccountOption component.
  late AccountOptionModel accountOptionModel2;
  // Model for AccountOption component.
  late AccountOptionModel accountOptionModel3;
  // Stores action output result for [Firestore Query - Query a collection] action in AccountOption widget.
  CodesRecord? codes;
  // Stores action output result for [Backend Call - Create Document] action in AccountOption widget.
  CodesRecord? newCode;
  // Model for AccountOption component.
  late AccountOptionModel accountOptionModel4;
  // Model for AccountOption component.
  late AccountOptionModel accountOptionModel5;
  // Model for AccountOption component.
  late AccountOptionModel accountOptionModel6;
  // Model for AccountOption component.
  late AccountOptionModel accountOptionModel7;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    accountOptionModel1 = createModel(context, () => AccountOptionModel());
    accountOptionModel2 = createModel(context, () => AccountOptionModel());
    accountOptionModel3 = createModel(context, () => AccountOptionModel());
    accountOptionModel4 = createModel(context, () => AccountOptionModel());
    accountOptionModel5 = createModel(context, () => AccountOptionModel());
    accountOptionModel6 = createModel(context, () => AccountOptionModel());
    accountOptionModel7 = createModel(context, () => AccountOptionModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    accountOptionModel1.dispose();
    accountOptionModel2.dispose();
    accountOptionModel3.dispose();
    accountOptionModel4.dispose();
    accountOptionModel5.dispose();
    accountOptionModel6.dispose();
    accountOptionModel7.dispose();
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
