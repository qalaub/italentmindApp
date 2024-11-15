import '/auth/firebase_auth/auth_util.dart';
import '/components/favorites_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import 'favorites1_widget.dart' show Favorites1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
