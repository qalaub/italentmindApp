import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/v2/n_e_w_spremiun/navbar/navbar_widget.dart';
import '/v2/n_e_w_spremiun/navbar_premiun/navbar_premiun_widget.dart';
import '/v2/upload_profile_image/upload_profile_image_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'profilesettings_widget.dart' show ProfilesettingsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilesettingsModel extends FlutterFlowModel<ProfilesettingsWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> imgs = [];
  void addToImgs(FFUploadedFile item) => imgs.add(item);
  void removeFromImgs(FFUploadedFile item) => imgs.remove(item);
  void removeAtIndexFromImgs(int index) => imgs.removeAt(index);
  void insertAtIndexInImgs(int index, FFUploadedFile item) =>
      imgs.insert(index, item);
  void updateImgsAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      imgs[index] = updateFn(imgs[index]);

  List<String> userImg = [];
  void addToUserImg(String item) => userImg.add(item);
  void removeFromUserImg(String item) => userImg.remove(item);
  void removeAtIndexFromUserImg(int index) => userImg.removeAt(index);
  void insertAtIndexInUserImg(int index, String item) =>
      userImg.insert(index, item);
  void updateUserImgAtIndex(int index, Function(String) updateFn) =>
      userImg[index] = updateFn(userImg[index]);

  ///  State fields for stateful widgets in this page.

  // Model for upload_profile_image component.
  late UploadProfileImageModel uploadProfileImageModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for services widget.
  String? servicesValue;
  FormFieldController<String>? servicesValueController;
  // State field(s) for servicesPremiun widget.
  List<String>? servicesPremiunValue;
  FormFieldController<List<String>>? servicesPremiunValueController;
  // State field(s) for age widget.
  String? ageValue;
  FormFieldController<String>? ageValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - verifySizeVideo] action in Button widget.
  bool? verifyVideo;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Model for Navbar component.
  late NavbarModel navbarModel;
  // Model for NavbarPremiun component.
  late NavbarPremiunModel navbarPremiunModel;

  @override
  void initState(BuildContext context) {
    uploadProfileImageModel =
        createModel(context, () => UploadProfileImageModel());
    navbarModel = createModel(context, () => NavbarModel());
    navbarPremiunModel = createModel(context, () => NavbarPremiunModel());
  }

  @override
  void dispose() {
    uploadProfileImageModel.dispose();
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    navbarModel.dispose();
    navbarPremiunModel.dispose();
  }
}
