import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/favoritesv2/add_favorites/add_favorites_widget.dart';
import '/v2/menbresiav2/membresia_logo/membresia_logo_widget.dart';
import 'v3fv0ritesv3_widget.dart' show V3fv0ritesv3Widget;
import 'package:flutter/material.dart';

class V3fv0ritesv3Model extends FlutterFlowModel<V3fv0ritesv3Widget> {
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

  String newSuburb = 'Location';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in v3fv0ritesv3 widget.
  UsersRecord? userCurrent;
  // Stores action output result for [Backend Call - API (getNamePlace)] action in v3fv0ritesv3 widget.
  ApiCallResponse? apiResult23d;
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
