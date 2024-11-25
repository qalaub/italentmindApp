// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RegisterFormTypeStruct extends FFFirebaseStruct {
  RegisterFormTypeStruct({
    String? firstName,
    String? lastName,
    DateTime? birthdate,
    String? phone,
    String? ndis,
    String? email,
    String? password,
    LatLng? ubication,
    LatLng? suburb,
    Roles? rol,
    Plan? plan,
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
        _rol = rol,
        _plan = plan,
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

  static RegisterFormTypeStruct fromMap(Map<String, dynamic> data) =>
      RegisterFormTypeStruct(
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        birthdate: data['birthdate'] as DateTime?,
        phone: data['phone'] as String?,
        ndis: data['ndis'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        ubication: data['ubication'] as LatLng?,
        suburb: data['suburb'] as LatLng?,
        rol: deserializeEnum<Roles>(data['rol']),
        plan: deserializeEnum<Plan>(data['plan']),
      );

  static RegisterFormTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? RegisterFormTypeStruct.fromMap(data.cast<String, dynamic>())
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
        'rol': _rol?.serialize(),
        'plan': _plan?.serialize(),
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
        'rol': serializeParam(
          _rol,
          ParamType.Enum,
        ),
        'plan': serializeParam(
          _plan,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static RegisterFormTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RegisterFormTypeStruct(
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
      );

  @override
  String toString() => 'RegisterFormTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RegisterFormTypeStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        birthdate == other.birthdate &&
        phone == other.phone &&
        ndis == other.ndis &&
        email == other.email &&
        password == other.password &&
        ubication == other.ubication &&
        suburb == other.suburb &&
        rol == other.rol &&
        plan == other.plan;
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
        rol,
        plan
      ]);
}

RegisterFormTypeStruct createRegisterFormTypeStruct({
  String? firstName,
  String? lastName,
  DateTime? birthdate,
  String? phone,
  String? ndis,
  String? email,
  String? password,
  LatLng? ubication,
  LatLng? suburb,
  Roles? rol,
  Plan? plan,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RegisterFormTypeStruct(
      firstName: firstName,
      lastName: lastName,
      birthdate: birthdate,
      phone: phone,
      ndis: ndis,
      email: email,
      password: password,
      ubication: ubication,
      suburb: suburb,
      rol: rol,
      plan: plan,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RegisterFormTypeStruct? updateRegisterFormTypeStruct(
  RegisterFormTypeStruct? registerFormType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    registerFormType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRegisterFormTypeStructData(
  Map<String, dynamic> firestoreData,
  RegisterFormTypeStruct? registerFormType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (registerFormType == null) {
    return;
  }
  if (registerFormType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && registerFormType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final registerFormTypeData =
      getRegisterFormTypeFirestoreData(registerFormType, forFieldValue);
  final nestedData =
      registerFormTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = registerFormType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRegisterFormTypeFirestoreData(
  RegisterFormTypeStruct? registerFormType, [
  bool forFieldValue = false,
]) {
  if (registerFormType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(registerFormType.toMap());

  // Add any Firestore field values
  registerFormType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRegisterFormTypeListFirestoreData(
  List<RegisterFormTypeStruct>? registerFormTypes,
) =>
    registerFormTypes
        ?.map((e) => getRegisterFormTypeFirestoreData(e, true))
        .toList() ??
    [];
