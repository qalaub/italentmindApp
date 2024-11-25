import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cliente_favorito_widget.dart' show ClienteFavoritoWidget;
import 'package:flutter/material.dart';

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
