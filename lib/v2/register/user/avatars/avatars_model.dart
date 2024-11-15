import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/avatar_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'avatars_widget.dart' show AvatarsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AvatarsModel extends FlutterFlowModel<AvatarsWidget> {
  ///  Local state fields for this page.

  String selectImage =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/italentmind-fog8iw/assets/lqmzv091wiyw/Frame_427320874.png';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
