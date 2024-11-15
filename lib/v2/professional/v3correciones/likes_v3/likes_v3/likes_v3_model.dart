import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'likes_v3_widget.dart' show LikesV3Widget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LikesV3Model extends FlutterFlowModel<LikesV3Widget> {
  ///  Local state fields for this component.

  String newSuburb = 'NWS, 2413';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in likesV3 widget.
  UsersRecord? newUser;
  // Stores action output result for [Backend Call - API (getNamePlace)] action in likesV3 widget.
  ApiCallResponse? apiResult63q;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
