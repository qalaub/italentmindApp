import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'cliente_favorito_widget.dart' show ClienteFavoritoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClienteFavoritoModel extends FlutterFlowModel<ClienteFavoritoWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> users = [];
  void addToUsers(DocumentReference item) => users.add(item);
  void removeFromUsers(DocumentReference item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void insertAtIndexInUsers(int index, DocumentReference item) =>
      users.insert(index, item);
  void updateUsersAtIndex(int index, Function(DocumentReference) updateFn) =>
      users[index] = updateFn(users[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ChatsRecord? chats;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  ChatsRecord? newRef;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  ChatsRecord? newChatThread;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
