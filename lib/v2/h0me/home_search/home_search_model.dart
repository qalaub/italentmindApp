import '/backend/backend.dart';
import '/components/home_vista_cuidador_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/h0me/map_button/map_button_widget.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import 'home_search_widget.dart' show HomeSearchWidget;
import 'package:flutter/material.dart';

class HomeSearchModel extends FlutterFlowModel<HomeSearchWidget> {
  ///  Local state fields for this page.

  DocumentReference? currentProfesionalMap;

  bool showMap = false;

  List<QueryResultsStruct> queryResults = [];
  void addToQueryResults(QueryResultsStruct item) => queryResults.add(item);
  void removeFromQueryResults(QueryResultsStruct item) =>
      queryResults.remove(item);
  void removeAtIndexFromQueryResults(int index) => queryResults.removeAt(index);
  void insertAtIndexInQueryResults(int index, QueryResultsStruct item) =>
      queryResults.insert(index, item);
  void updateQueryResultsAtIndex(
          int index, Function(QueryResultsStruct) updateFn) =>
      queryResults[index] = updateFn(queryResults[index]);

  bool isLoading = false;

  String? newUbication;

  ///  State fields for stateful widgets in this page.

  // Model for MapButton component.
  late MapButtonModel mapButtonModel1;
  // Model for MapButton component.
  late MapButtonModel mapButtonModel2;
  // Model for HomeVistaCuidador component.
  late HomeVistaCuidadorModel homeVistaCuidadorModel;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    mapButtonModel1 = createModel(context, () => MapButtonModel());
    mapButtonModel2 = createModel(context, () => MapButtonModel());
    homeVistaCuidadorModel =
        createModel(context, () => HomeVistaCuidadorModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    mapButtonModel1.dispose();
    mapButtonModel2.dispose();
    homeVistaCuidadorModel.dispose();
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }

  /// Action blocks.
  Future pruebaBlock(BuildContext context) async {}
}
