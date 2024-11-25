import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import '/v2/user/descripcion_profesional/descripcion_profesional_widget.dart';
import 'profile_info_widget.dart' show ProfileInfoWidget;
import 'package:flutter/material.dart';

class ProfileInfoModel extends FlutterFlowModel<ProfileInfoWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> userToAdd = [];
  void addToUserToAdd(DocumentReference item) => userToAdd.add(item);
  void removeFromUserToAdd(DocumentReference item) => userToAdd.remove(item);
  void removeAtIndexFromUserToAdd(int index) => userToAdd.removeAt(index);
  void insertAtIndexInUserToAdd(int index, DocumentReference item) =>
      userToAdd.insert(index, item);
  void updateUserToAddAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      userToAdd[index] = updateFn(userToAdd[index]);

  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  // Stores action output result for [Firestore Query - Query a collection] action in MENSAJES widget.
  List<ChatsRecord>? chatRef;
  // Model for AddFavorites component.
  late AddFavoritesModel addFavoritesModel;
  // Model for MembresiaLogo component.
  late MembresiaLogoModel membresiaLogoModel;
  // Model for DescripcionProfesional component.
  late DescripcionProfesionalModel descripcionProfesionalModel;

  @override
  void initState(BuildContext context) {
    addFavoritesModel = createModel(context, () => AddFavoritesModel());
    membresiaLogoModel = createModel(context, () => MembresiaLogoModel());
    descripcionProfesionalModel =
        createModel(context, () => DescripcionProfesionalModel());
  }

  @override
  void dispose() {
    addFavoritesModel.dispose();
    membresiaLogoModel.dispose();
    descripcionProfesionalModel.dispose();
  }
}
