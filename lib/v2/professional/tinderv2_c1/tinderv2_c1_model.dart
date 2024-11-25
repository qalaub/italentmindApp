import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/professional/mensage_tinder/mensage_tinder_widget.dart';
import 'tinderv2_c1_widget.dart' show Tinderv2C1Widget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Tinderv2C1Model extends FlutterFlowModel<Tinderv2C1Widget> {
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

  UsersRecord? currentProfessional;

  List<UsersRecord> professionals = [];
  void addToProfessionals(UsersRecord item) => professionals.add(item);
  void removeFromProfessionals(UsersRecord item) => professionals.remove(item);
  void removeAtIndexFromProfessionals(int index) =>
      professionals.removeAt(index);
  void insertAtIndexInProfessionals(int index, UsersRecord item) =>
      professionals.insert(index, item);
  void updateProfessionalsAtIndex(int index, Function(UsersRecord) updateFn) =>
      professionals[index] = updateFn(professionals[index]);

  int currentIndex = 0;

  bool showMessage = false;

  String temp = 'hola';

  bool showLanguagues = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in tinderv2C1 widget.
  List<UsersRecord>? professional;
  // Model for MENSAGE_TINDER component.
  late MensageTinderModel mensageTinderModel;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Stores action output result for [Firestore Query - Query a collection] action in SwipeableStack widget.
  ChatsRecord? chats;
  // Stores action output result for [Firestore Query - Query a collection] action in SwipeableStack widget.
  ChatsRecord? newRef;
  // Stores action output result for [Backend Call - Create Document] action in SwipeableStack widget.
  ChatsRecord? newChatThread;
  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    mensageTinderModel = createModel(context, () => MensageTinderModel());
    swipeableStackController = CardSwiperController();
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    mensageTinderModel.dispose();
    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
