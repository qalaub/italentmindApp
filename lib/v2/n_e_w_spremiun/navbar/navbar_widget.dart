import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar_professional/navbar_professional_widget.dart';
import '/v2/n_e_w_spremiun/navbar_user/navbar_user_widget.dart';
import 'package:flutter/material.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if ((currentUserDocument?.rol == Roles.user) ||
            (currentUserDocument?.rol == null)) {
          return wrapWithModel(
            model: _model.navbarUserModel,
            updateCallback: () => safeSetState(() {}),
            child: const NavbarUserWidget(),
          );
        } else {
          return wrapWithModel(
            model: _model.navbarProfessionalModel,
            updateCallback: () => safeSetState(() {}),
            child: const NavbarProfessionalWidget(),
          );
        }
      },
    );
  }
}
