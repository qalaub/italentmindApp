import '/backend/backend.dart';
import '/chat_groupwbubbles/chat_thread_update/chat_thread_update_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_thread_component_copy_widget.dart'
    show ChatThreadComponentCopyWidget;
import 'package:flutter/material.dart';

class ChatThreadComponentCopyModel
    extends FlutterFlowModel<ChatThreadComponentCopyWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> lastSeenBy = [];
  void addToLastSeenBy(DocumentReference item) => lastSeenBy.add(item);
  void removeFromLastSeenBy(DocumentReference item) => lastSeenBy.remove(item);
  void removeAtIndexFromLastSeenBy(int index) => lastSeenBy.removeAt(index);
  void insertAtIndexInLastSeenBy(int index, DocumentReference item) =>
      lastSeenBy.insert(index, item);
  void updateLastSeenByAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      lastSeenBy[index] = updateFn(lastSeenBy[index]);

  List<String> imagesUploaded = [];
  void addToImagesUploaded(String item) => imagesUploaded.add(item);
  void removeFromImagesUploaded(String item) => imagesUploaded.remove(item);
  void removeAtIndexFromImagesUploaded(int index) =>
      imagesUploaded.removeAt(index);
  void insertAtIndexInImagesUploaded(int index, String item) =>
      imagesUploaded.insert(index, item);
  void updateImagesUploadedAtIndex(int index, Function(String) updateFn) =>
      imagesUploaded[index] = updateFn(imagesUploaded[index]);

  bool? isStandar = false;

  bool isRecording = false;

  bool isTyping = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in chat_ThreadComponentCopy widget.
  ChatMessagesRecord? thereChat;
  List<ChatMessagesRecord>? listViewPreviousSnapshot;
  // Models for chat_threadUpdate dynamic component.
  late FlutterFlowDynamicModels<ChatThreadUpdateModel> chatThreadUpdateModels;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iu5uvngo' /* Field is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in TextField widget.
  ChatMessagesRecord? newChatMessage;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? newChat;

  @override
  void initState(BuildContext context) {
    chatThreadUpdateModels =
        FlutterFlowDynamicModels(() => ChatThreadUpdateModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    chatThreadUpdateModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
