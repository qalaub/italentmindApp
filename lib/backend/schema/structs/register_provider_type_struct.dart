// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegisterProviderTypeStruct extends FFFirebaseStruct {
  RegisterProviderTypeStruct({
    String? firstName,
    String? lastName,
    DateTime? birthdate,
    String? phone,
    String? ndis,
    String? email,
    String? password,
    LatLng? ubication,
    LatLng? suburb,
    String? company,
    String? age,
    String? description,
    String? gender,
    int? years,
    String? languagues,
    List<String>? images,
    Roles? rol,
    Plan? plan,
    DateTime? updateTime,
    List<String>? serviceType,
    DocumentReference? business,
    List<String>? disabilities,
    List<String>? schedule,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _lastName = lastName,
        _birthdate = birthdate,
        _phone = phone,
        _ndis = ndis,
        _email = email,
        _password = password,
        _ubication = ubication,
        _suburb = suburb,
        _company = company,
        _age = age,
        _description = description,
        _gender = gender,
        _years = years,
        _languagues = languagues,
        _images = images,
        _rol = rol,
        _plan = plan,
        _updateTime = updateTime,
        _serviceType = serviceType,
        _business = business,
        _disabilities = disabilities,
        _schedule = schedule,
        super(firestoreUtilData);

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  set birthdate(DateTime? val) => _birthdate = val;

  bool hasBirthdate() => _birthdate != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "ndis" field.
  String? _ndis;
  String get ndis => _ndis ?? '';
  set ndis(String? val) => _ndis = val;

  bool hasNdis() => _ndis != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "ubication" field.
  LatLng? _ubication;
  LatLng? get ubication => _ubication;
  set ubication(LatLng? val) => _ubication = val;

  bool hasUbication() => _ubication != null;

  // "suburb" field.
  LatLng? _suburb;
  LatLng? get suburb => _suburb;
  set suburb(LatLng? val) => _suburb = val;

  bool hasSuburb() => _suburb != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  set company(String? val) => _company = val;

  bool hasCompany() => _company != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;

  bool hasAge() => _age != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "years" field.
  int? _years;
  int get years => _years ?? 0;
  set years(int? val) => _years = val;

  void incrementYears(int amount) => years = years + amount;

  bool hasYears() => _years != null;

  // "languagues" field.
  String? _languagues;
  String get languagues => _languagues ?? '';
  set languagues(String? val) => _languagues = val;

  bool hasLanguagues() => _languagues != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "rol" field.
  Roles? _rol;
  Roles get rol => _rol ?? Roles.user;
  set rol(Roles? val) => _rol = val;

  bool hasRol() => _rol != null;

  // "plan" field.
  Plan? _plan;
  Plan get plan => _plan ?? Plan.basic;
  set plan(Plan? val) => _plan = val;

  bool hasPlan() => _plan != null;

  // "update_time" field.
  DateTime? _updateTime;
  DateTime? get updateTime => _updateTime;
  set updateTime(DateTime? val) => _updateTime = val;

  bool hasUpdateTime() => _updateTime != null;

  // "serviceType" field.
  List<String>? _serviceType;
  List<String> get serviceType => _serviceType ?? const [];
  set serviceType(List<String>? val) => _serviceType = val;

  void updateServiceType(Function(List<String>) updateFn) {
    updateFn(_serviceType ??= []);
  }

  bool hasServiceType() => _serviceType != null;

  // "business" field.
  DocumentReference? _business;
  DocumentReference? get business => _business;
  set business(DocumentReference? val) => _business = val;

  bool hasBusiness() => _business != null;

  // "disabilities" field.
  List<String>? _disabilities;
  List<String> get disabilities => _disabilities ?? const [];
  set disabilities(List<String>? val) => _disabilities = val;

  void updateDisabilities(Function(List<String>) updateFn) {
    updateFn(_disabilities ??= []);
  }

  bool hasDisabilities() => _disabilities != null;

  // "schedule" field.
  List<String>? _schedule;
  List<String> get schedule => _schedule ?? const [];
  set schedule(List<String>? val) => _schedule = val;

  void updateSchedule(Function(List<String>) updateFn) {
    updateFn(_schedule ??= []);
  }

  bool hasSchedule() => _schedule != null;

  static RegisterProviderTypeStruct fromMap(Map<String, dynamic> data) =>
      RegisterProviderTypeStruct(
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        birthdate: data['birthdate'] as DateTime?,
        phone: data['phone'] as String?,
        ndis: data['ndis'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        ubication: data['ubication'] as LatLng?,
        suburb: data['suburb'] as LatLng?,
        company: data['company'] as String?,
        age: data['age'] as String?,
        description: data['description'] as String?,
        gender: data['gender'] as String?,
        years: castToType<int>(data['years']),
        languagues: data['languagues'] as String?,
        images: getDataList(data['images']),
        rol: deserializeEnum<Roles>(data['rol']),
        plan: deserializeEnum<Plan>(data['plan']),
        updateTime: data['update_time'] as DateTime?,
        serviceType: getDataList(data['serviceType']),
        business: data['business'] as DocumentReference?,
        disabilities: getDataList(data['disabilities']),
        schedule: getDataList(data['schedule']),
      );

  static RegisterProviderTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? RegisterProviderTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'firstName': _firstName,
        'lastName': _lastName,
        'birthdate': _birthdate,
        'phone': _phone,
        'ndis': _ndis,
        'email': _email,
        'password': _password,
        'ubication': _ubication,
        'suburb': _suburb,
        'company': _company,
        'age': _age,
        'description': _description,
        'gender': _gender,
        'years': _years,
        'languagues': _languagues,
        'images': _images,
        'rol': _rol?.serialize(),
        'plan': _plan?.serialize(),
        'update_time': _updateTime,
        'serviceType': _serviceType,
        'business': _business,
        'disabilities': _disabilities,
        'schedule': _schedule,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'birthdate': serializeParam(
          _birthdate,
          ParamType.DateTime,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'ndis': serializeParam(
          _ndis,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'ubication': serializeParam(
          _ubication,
          ParamType.LatLng,
        ),
        'suburb': serializeParam(
          _suburb,
          ParamType.LatLng,
        ),
        'company': serializeParam(
          _company,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'years': serializeParam(
          _years,
          ParamType.int,
        ),
        'languagues': serializeParam(
          _languagues,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'rol': serializeParam(
          _rol,
          ParamType.Enum,
        ),
        'plan': serializeParam(
          _plan,
          ParamType.Enum,
        ),
        'update_time': serializeParam(
          _updateTime,
          ParamType.DateTime,
        ),
        'serviceType': serializeParam(
          _serviceType,
          ParamType.String,
          isList: true,
        ),
        'business': serializeParam(
          _business,
          ParamType.DocumentReference,
        ),
        'disabilities': serializeParam(
          _disabilities,
          ParamType.String,
          isList: true,
        ),
        'schedule': serializeParam(
          _schedule,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static RegisterProviderTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RegisterProviderTypeStruct(
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        birthdate: deserializeParam(
          data['birthdate'],
          ParamType.DateTime,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        ndis: deserializeParam(
          data['ndis'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        ubication: deserializeParam(
          data['ubication'],
          ParamType.LatLng,
          false,
        ),
        suburb: deserializeParam(
          data['suburb'],
          ParamType.LatLng,
          false,
        ),
        company: deserializeParam(
          data['company'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        years: deserializeParam(
          data['years'],
          ParamType.int,
          false,
        ),
        languagues: deserializeParam(
          data['languagues'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        rol: deserializeParam<Roles>(
          data['rol'],
          ParamType.Enum,
          false,
        ),
        plan: deserializeParam<Plan>(
          data['plan'],
          ParamType.Enum,
          false,
        ),
        updateTime: deserializeParam(
          data['update_time'],
          ParamType.DateTime,
          false,
        ),
        serviceType: deserializeParam<String>(
          data['serviceType'],
          ParamType.String,
          true,
        ),
        business: deserializeParam(
          data['business'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        disabilities: deserializeParam<String>(
          data['disabilities'],
          ParamType.String,
          true,
        ),
        schedule: deserializeParam<String>(
          data['schedule'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'RegisterProviderTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RegisterProviderTypeStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        birthdate == other.birthdate &&
        phone == other.phone &&
        ndis == other.ndis &&
        email == other.email &&
        password == other.password &&
        ubication == other.ubication &&
        suburb == other.suburb &&
        company == other.company &&
        age == other.age &&
        description == other.description &&
        gender == other.gender &&
        years == other.years &&
        languagues == other.languagues &&
        listEquality.equals(images, other.images) &&
        rol == other.rol &&
        plan == other.plan &&
        updateTime == other.updateTime &&
        listEquality.equals(serviceType, other.serviceType) &&
        business == other.business &&
        listEquality.equals(disabilities, other.disabilities) &&
        listEquality.equals(schedule, other.schedule);
  }

  @override
  int get hashCode => const ListEquality().hash([
        firstName,
        lastName,
        birthdate,
        phone,
        ndis,
        email,
        password,
        ubication,
        suburb,
        company,
        age,
        description,
        gender,
        years,
        languagues,
        images,
        rol,
        plan,
        updateTime,
        serviceType,
        business,
        disabilities,
        schedule
      ]);
}

RegisterProviderTypeStruct createRegisterProviderTypeStruct({
  String? firstName,
  String? lastName,
  DateTime? birthdate,
  String? phone,
  String? ndis,
  String? email,
  String? password,
  LatLng? ubication,
  LatLng? suburb,
  String? company,
  String? age,
  String? description,
  String? gender,
  int? years,
  String? languagues,
  Roles? rol,
  Plan? plan,
  DateTime? updateTime,
  DocumentReference? business,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RegisterProviderTypeStruct(
      firstName: firstName,
      lastName: lastName,
      birthdate: birthdate,
      phone: phone,
      ndis: ndis,
      email: email,
      password: password,
      ubication: ubication,
      suburb: suburb,
      company: company,
      age: age,
      description: description,
      gender: gender,
      years: years,
      languagues: languagues,
      rol: rol,
      plan: plan,
      updateTime: updateTime,
      business: business,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RegisterProviderTypeStruct? updateRegisterProviderTypeStruct(
  RegisterProviderTypeStruct? registerProviderType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    registerProviderType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRegisterProviderTypeStructData(
  Map<String, dynamic> firestoreData,
  RegisterProviderTypeStruct? registerProviderType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (registerProviderType == null) {
    return;
  }
  if (registerProviderType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && registerProviderType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final registerProviderTypeData =
      getRegisterProviderTypeFirestoreData(registerProviderType, forFieldValue);
  final nestedData =
      registerProviderTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      registerProviderType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRegisterProviderTypeFirestoreData(
  RegisterProviderTypeStruct? registerProviderType, [
  bool forFieldValue = false,
]) {
  if (registerProviderType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(registerProviderType.toMap());

  // Add any Firestore field values
  registerProviderType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRegisterProviderTypeListFirestoreData(
  List<RegisterProviderTypeStruct>? registerProviderTypes,
) =>
    registerProviderTypes
        ?.map((e) => getRegisterProviderTypeFirestoreData(e, true))
        .toList() ??
    [];
