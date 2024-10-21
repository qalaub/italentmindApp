import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _showTutorial = prefs.getBool('ff_showTutorial') ?? _showTutorial;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  RegisterFormTypeStruct _registerUserForm = RegisterFormTypeStruct();
  RegisterFormTypeStruct get registerUserForm => _registerUserForm;
  set registerUserForm(RegisterFormTypeStruct value) {
    _registerUserForm = value;
  }

  void updateRegisterUserFormStruct(Function(RegisterFormTypeStruct) updateFn) {
    updateFn(_registerUserForm);
  }

  RegisterProviderTypeStruct _registerProviderForm =
      RegisterProviderTypeStruct.fromSerializableMap(jsonDecode(
          '{\"images\":\"[]\",\"serviceType\":\"[]\",\"disabilities\":\"[]\",\"schedule\":\"[\\\"Monday\\\",\\\"Tuesday\\\",\\\"Wednesday\\\",\\\"Thursday\\\",\\\"Friday\\\",\\\"Saturday\\\",\\\"Sunday\\\"]\"}'));
  RegisterProviderTypeStruct get registerProviderForm => _registerProviderForm;
  set registerProviderForm(RegisterProviderTypeStruct value) {
    _registerProviderForm = value;
  }

  void updateRegisterProviderFormStruct(
      Function(RegisterProviderTypeStruct) updateFn) {
    updateFn(_registerProviderForm);
  }

  int _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
  }

  int _increment = 0;
  int get increment => _increment;
  set increment(int value) {
    _increment = value;
  }

  List<String> _imagesUserUpload = [];
  List<String> get imagesUserUpload => _imagesUserUpload;
  set imagesUserUpload(List<String> value) {
    _imagesUserUpload = value;
  }

  void addToImagesUserUpload(String value) {
    imagesUserUpload.add(value);
  }

  void removeFromImagesUserUpload(String value) {
    imagesUserUpload.remove(value);
  }

  void removeAtIndexFromImagesUserUpload(int index) {
    imagesUserUpload.removeAt(index);
  }

  void updateImagesUserUploadAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imagesUserUpload[index] = updateFn(_imagesUserUpload[index]);
  }

  void insertAtIndexInImagesUserUpload(int index, String value) {
    imagesUserUpload.insert(index, value);
  }

  FormVerifyStruct _verifyForm = FormVerifyStruct();
  FormVerifyStruct get verifyForm => _verifyForm;
  set verifyForm(FormVerifyStruct value) {
    _verifyForm = value;
  }

  void updateVerifyFormStruct(Function(FormVerifyStruct) updateFn) {
    updateFn(_verifyForm);
  }

  bool _authUserFireBase = false;
  bool get authUserFireBase => _authUserFireBase;
  set authUserFireBase(bool value) {
    _authUserFireBase = value;
  }

  bool _favoritesChange = false;
  bool get favoritesChange => _favoritesChange;
  set favoritesChange(bool value) {
    _favoritesChange = value;
  }

  DocumentReference? _currentChat;
  DocumentReference? get currentChat => _currentChat;
  set currentChat(DocumentReference? value) {
    _currentChat = value;
  }

  LatLng? _tempLocation = const LatLng(-26.8357181, 152.963113);
  LatLng? get tempLocation => _tempLocation;
  set tempLocation(LatLng? value) {
    _tempLocation = value;
  }

  bool _isMENUvisible = false;
  bool get isMENUvisible => _isMENUvisible;
  set isMENUvisible(bool value) {
    _isMENUvisible = value;
  }

  FiltersStruct _filtersPage = FiltersStruct.fromSerializableMap(jsonDecode(
      '{\"distance\":\"1000000\",\"age\":\"[\\\"40-65+ years\\\",\\\"25-40 years\\\",\\\"18-25 years\\\"]\",\"services\":\"[\\\"Support Workers\\\",\\\"Support  Coordinators\\\",\\\"Therapeutic Supports\\\",\\\"Home Maintenance\\\",\\\"Recovery Coaches\\\"]\",\"schedule\":\"[\\\"Monday\\\",\\\"Tuesday\\\",\\\"Wednesday\\\",\\\"Thursday\\\",\\\"Friday\\\",\\\"Saturday\\\",\\\"Sunday\\\"]\"}'));
  FiltersStruct get filtersPage => _filtersPage;
  set filtersPage(FiltersStruct value) {
    _filtersPage = value;
  }

  void updateFiltersPageStruct(Function(FiltersStruct) updateFn) {
    updateFn(_filtersPage);
  }

  bool _showTutorial = true;
  bool get showTutorial => _showTutorial;
  set showTutorial(bool value) {
    _showTutorial = value;
    prefs.setBool('ff_showTutorial', value);
  }

  String _newUbicationProfessional = '';
  String get newUbicationProfessional => _newUbicationProfessional;
  set newUbicationProfessional(String value) {
    _newUbicationProfessional = value;
  }

  int _zoomFilter = 10000;
  int get zoomFilter => _zoomFilter;
  set zoomFilter(int value) {
    _zoomFilter = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
