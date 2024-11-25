// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltersStruct extends FFFirebaseStruct {
  FiltersStruct({
    double? distance,
    List<String>? age,
    List<String>? services,
    String? language,
    List<String>? schedule,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _distance = distance,
        _age = age,
        _services = services,
        _language = language,
        _schedule = schedule,
        super(firestoreUtilData);

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  set distance(double? val) => _distance = val;

  void incrementDistance(double amount) => distance = distance + amount;

  bool hasDistance() => _distance != null;

  // "age" field.
  List<String>? _age;
  List<String> get age => _age ?? const [];
  set age(List<String>? val) => _age = val;

  void updateAge(Function(List<String>) updateFn) {
    updateFn(_age ??= []);
  }

  bool hasAge() => _age != null;

  // "services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  set services(List<String>? val) => _services = val;

  void updateServices(Function(List<String>) updateFn) {
    updateFn(_services ??= []);
  }

  bool hasServices() => _services != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  // "schedule" field.
  List<String>? _schedule;
  List<String> get schedule => _schedule ?? const [];
  set schedule(List<String>? val) => _schedule = val;

  void updateSchedule(Function(List<String>) updateFn) {
    updateFn(_schedule ??= []);
  }

  bool hasSchedule() => _schedule != null;

  static FiltersStruct fromMap(Map<String, dynamic> data) => FiltersStruct(
        distance: castToType<double>(data['distance']),
        age: getDataList(data['age']),
        services: getDataList(data['services']),
        language: data['language'] as String?,
        schedule: getDataList(data['schedule']),
      );

  static FiltersStruct? maybeFromMap(dynamic data) =>
      data is Map ? FiltersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'distance': _distance,
        'age': _age,
        'services': _services,
        'language': _language,
        'schedule': _schedule,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'distance': serializeParam(
          _distance,
          ParamType.double,
        ),
        'age': serializeParam(
          _age,
          ParamType.String,
          isList: true,
        ),
        'services': serializeParam(
          _services,
          ParamType.String,
          isList: true,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
        'schedule': serializeParam(
          _schedule,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static FiltersStruct fromSerializableMap(Map<String, dynamic> data) =>
      FiltersStruct(
        distance: deserializeParam(
          data['distance'],
          ParamType.double,
          false,
        ),
        age: deserializeParam<String>(
          data['age'],
          ParamType.String,
          true,
        ),
        services: deserializeParam<String>(
          data['services'],
          ParamType.String,
          true,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
        schedule: deserializeParam<String>(
          data['schedule'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'FiltersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FiltersStruct &&
        distance == other.distance &&
        listEquality.equals(age, other.age) &&
        listEquality.equals(services, other.services) &&
        language == other.language &&
        listEquality.equals(schedule, other.schedule);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([distance, age, services, language, schedule]);
}

FiltersStruct createFiltersStruct({
  double? distance,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FiltersStruct(
      distance: distance,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FiltersStruct? updateFiltersStruct(
  FiltersStruct? filters, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filters
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFiltersStructData(
  Map<String, dynamic> firestoreData,
  FiltersStruct? filters,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filters == null) {
    return;
  }
  if (filters.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filters.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filtersData = getFiltersFirestoreData(filters, forFieldValue);
  final nestedData = filtersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filters.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFiltersFirestoreData(
  FiltersStruct? filters, [
  bool forFieldValue = false,
]) {
  if (filters == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filters.toMap());

  // Add any Firestore field values
  filters.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFiltersListFirestoreData(
  List<FiltersStruct>? filterss,
) =>
    filterss?.map((e) => getFiltersFirestoreData(e, true)).toList() ?? [];
