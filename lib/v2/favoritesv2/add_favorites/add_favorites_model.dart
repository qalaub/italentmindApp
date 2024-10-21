import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_favorites_widget.dart' show AddFavoritesWidget;
import 'package:flutter/material.dart';

class AddFavoritesModel extends FlutterFlowModel<AddFavoritesWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> userToAdd = [];
  void addToUserToAdd(DocumentReference item) => userToAdd.add(item);
  void removeFromUserToAdd(DocumentReference item) => userToAdd.remove(item);
  void removeAtIndexFromUserToAdd(int index) => userToAdd.removeAt(index);
  void insertAtIndexInUserToAdd(int index, DocumentReference item) =>
      userToAdd.insert(index, item);
  void updateUserToAddAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userToAdd[index] = updateFn(userToAdd[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ChatsRecord? newRef;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? newChatThread;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
