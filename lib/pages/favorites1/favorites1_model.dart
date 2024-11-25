import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import 'favorites1_widget.dart' show Favorites1Widget;
import 'package:flutter/material.dart';

class Favorites1Model extends FlutterFlowModel<Favorites1Widget> {
  ///  Local state fields for this page.

  List<DocumentReference> favorites = [];
  void addToFavorites(DocumentReference item) => favorites.add(item);
  void removeFromFavorites(DocumentReference item) => favorites.remove(item);
  void removeAtIndexFromFavorites(int index) => favorites.removeAt(index);
  void insertAtIndexInFavorites(int index, DocumentReference item) =>
      favorites.insert(index, item);
  void updateFavoritesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      favorites[index] = updateFn(favorites[index]);

  int? counter;

  ///  State fields for stateful widgets in this page.

  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
