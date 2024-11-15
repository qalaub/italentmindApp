import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/image_upload_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'register_pfofesional4_widget.dart' show RegisterPfofesional4Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterPfofesional4Model
    extends FlutterFlowModel<RegisterPfofesional4Widget> {
  ///  Local state fields for this page.

  bool photosVerify = true;

  List<DocumentReference> userChat = [];
  void addToUserChat(DocumentReference item) => userChat.add(item);
  void removeFromUserChat(DocumentReference item) => userChat.remove(item);
  void removeAtIndexFromUserChat(int index) => userChat.removeAt(index);
  void insertAtIndexInUserChat(int index, DocumentReference item) =>
      userChat.insert(index, item);
  void updateUserChatAtIndex(int index, Function(DocumentReference) updateFn) =>
      userChat[index] = updateFn(userChat[index]);

  ///  State fields for stateful widgets in this page.

  // Model for img1.
  late ImageUploadModel img1Model;
  // Model for img2.
  late ImageUploadModel img2Model;
  // Model for img3.
  late ImageUploadModel img3Model;
  // Model for img4.
  late ImageUploadModel img4Model;
  // Model for img5.
  late ImageUploadModel img5Model;
  // Model for img6.
  late ImageUploadModel img6Model;
  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {
    img1Model = createModel(context, () => ImageUploadModel());
    img2Model = createModel(context, () => ImageUploadModel());
    img3Model = createModel(context, () => ImageUploadModel());
    img4Model = createModel(context, () => ImageUploadModel());
    img5Model = createModel(context, () => ImageUploadModel());
    img6Model = createModel(context, () => ImageUploadModel());
  }

  @override
  void dispose() {
    img1Model.dispose();
    img2Model.dispose();
    img3Model.dispose();
    img4Model.dispose();
    img5Model.dispose();
    img6Model.dispose();
  }
}
