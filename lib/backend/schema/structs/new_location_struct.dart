// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewLocationStruct extends FFFirebaseStruct {
  NewLocationStruct({
    double? lat,
    double? lng,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lat = lat,
        _lng = lng,
        super(firestoreUtilData);

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;

  void incrementLng(double amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

  static NewLocationStruct fromMap(Map<String, dynamic> data) =>
      NewLocationStruct(
        lat: castToType<double>(data['lat']),
        lng: castToType<double>(data['lng']),
      );

  static NewLocationStruct? maybeFromMap(dynamic data) => data is Map
      ? NewLocationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lat': _lat,
        'lng': _lng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
      }.withoutNulls;

  static NewLocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewLocationStruct(
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'NewLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewLocationStruct && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode => const ListEquality().hash([lat, lng]);
}

NewLocationStruct createNewLocationStruct({
  double? lat,
  double? lng,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewLocationStruct(
      lat: lat,
      lng: lng,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewLocationStruct? updateNewLocationStruct(
  NewLocationStruct? newLocation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newLocation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewLocationStructData(
  Map<String, dynamic> firestoreData,
  NewLocationStruct? newLocation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newLocation == null) {
    return;
  }
  if (newLocation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newLocation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newLocationData =
      getNewLocationFirestoreData(newLocation, forFieldValue);
  final nestedData =
      newLocationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = newLocation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewLocationFirestoreData(
  NewLocationStruct? newLocation, [
  bool forFieldValue = false,
]) {
  if (newLocation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newLocation.toMap());

  // Add any Firestore field values
  newLocation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewLocationListFirestoreData(
  List<NewLocationStruct>? newLocations,
) =>
    newLocations?.map((e) => getNewLocationFirestoreData(e, true)).toList() ??
    [];
