import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'likes_v3_widget.dart' show LikesV3Widget;
import 'package:flutter/material.dart';

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
