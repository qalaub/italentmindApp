import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar_professional/navbar_professional_widget.dart';
import '/v2/n_e_w_spremiun/navbar_user/navbar_user_widget.dart';
import 'navbar_widget.dart' show NavbarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavbarModel extends FlutterFlowModel<NavbarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for NavbarUser component.
  late NavbarUserModel navbarUserModel;
  // Model for NavbarProfessional component.
  late NavbarProfessionalModel navbarProfessionalModel;

  @override
  void initState(BuildContext context) {
    navbarUserModel = createModel(context, () => NavbarUserModel());
    navbarProfessionalModel =
        createModel(context, () => NavbarProfessionalModel());
  }

  @override
  void dispose() {
    navbarUserModel.dispose();
    navbarProfessionalModel.dispose();
  }
}
