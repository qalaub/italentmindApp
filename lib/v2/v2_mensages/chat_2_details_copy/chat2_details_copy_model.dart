import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chat_groupwbubbles/chat_thread_component_copy/chat_thread_component_copy_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/v2/options_message/options_message_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat2_details_copy_widget.dart' show Chat2DetailsCopyWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Chat2DetailsCopyModel extends FlutterFlowModel<Chat2DetailsCopyWidget> {
  ///  Local state fields for this page.

  List<String> uploadedImages = [];
  void addToUploadedImages(String item) => uploadedImages.add(item);
  void removeFromUploadedImages(String item) => uploadedImages.remove(item);
  void removeAtIndexFromUploadedImages(int index) =>
      uploadedImages.removeAt(index);
  void insertAtIndexInUploadedImages(int index, String item) =>
      uploadedImages.insert(index, item);
  void updateUploadedImagesAtIndex(int index, Function(String) updateFn) =>
      uploadedImages[index] = updateFn(uploadedImages[index]);

  List<DocumentReference> lastMessageSeenBy = [];
  void addToLastMessageSeenBy(DocumentReference item) =>
      lastMessageSeenBy.add(item);
  void removeFromLastMessageSeenBy(DocumentReference item) =>
      lastMessageSeenBy.remove(item);
  void removeAtIndexFromLastMessageSeenBy(int index) =>
      lastMessageSeenBy.removeAt(index);
  void insertAtIndexInLastMessageSeenBy(int index, DocumentReference item) =>
      lastMessageSeenBy.insert(index, item);
  void updateLastMessageSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastMessageSeenBy[index] = updateFn(lastMessageSeenBy[index]);

  bool showMenu = false;

  ///  State fields for stateful widgets in this page.

  // Model for chat_ThreadComponentCopy component.
  late ChatThreadComponentCopyModel chatThreadComponentCopyModel;
  // Model for optionsMessage component.
  late OptionsMessageModel optionsMessageModel;

  @override
  void initState(BuildContext context) {
    chatThreadComponentCopyModel =
        createModel(context, () => ChatThreadComponentCopyModel());
    optionsMessageModel = createModel(context, () => OptionsMessageModel());
  }

  @override
  void dispose() {
    chatThreadComponentCopyModel.dispose();
    optionsMessageModel.dispose();
  }
}
