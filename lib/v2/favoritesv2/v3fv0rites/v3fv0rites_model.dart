import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'v3fv0rites_widget.dart' show V3fv0ritesWidget;
import 'package:flutter/material.dart';

class V3fv0ritesModel extends FlutterFlowModel<V3fv0ritesWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> usersToAdd = [];
  void addToUsersToAdd(DocumentReference item) => usersToAdd.add(item);
  void removeFromUsersToAdd(DocumentReference item) => usersToAdd.remove(item);
  void removeAtIndexFromUsersToAdd(int index) => usersToAdd.removeAt(index);
  void insertAtIndexInUsersToAdd(int index, DocumentReference item) =>
      usersToAdd.insert(index, item);
  void updateUsersToAddAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersToAdd[index] = updateFn(usersToAdd[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Stores action output result for [Firestore Query - Query a collection] action in RatingBar widget.
  ReviewsRecord? reviewsC;
  // Model for AddFavorites component.
  late AddFavoritesModel addFavoritesModel;
  // Model for MembresiaLogo component.
  late MembresiaLogoModel membresiaLogoModel;

  @override
  void initState(BuildContext context) {
    addFavoritesModel = createModel(context, () => AddFavoritesModel());
    membresiaLogoModel = createModel(context, () => MembresiaLogoModel());
  }

  @override
  void dispose() {
    addFavoritesModel.dispose();
    membresiaLogoModel.dispose();
  }
}
