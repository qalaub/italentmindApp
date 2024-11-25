import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import 'chat2_main_widget.dart' show Chat2MainWidget;
import 'package:flutter/material.dart';

class Chat2MainModel extends FlutterFlowModel<Chat2MainWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
