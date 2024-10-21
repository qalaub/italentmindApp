// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class QueryResultsStruct extends FFFirebaseStruct {
  QueryResultsStruct({
    String? placeId,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _placeId = placeId,
        _description = description,
        super(firestoreUtilData);

  // "place_id" field.
  String? _placeId;
  String get placeId => _placeId ?? '';
  set placeId(String? val) => _placeId = val;

  bool hasPlaceId() => _placeId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static QueryResultsStruct fromMap(Map<String, dynamic> data) =>
      QueryResultsStruct(
        placeId: data['place_id'] as String?,
        description: data['description'] as String?,
      );

  static QueryResultsStruct? maybeFromMap(dynamic data) => data is Map
      ? QueryResultsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'place_id': _placeId,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'place_id': serializeParam(
          _placeId,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static QueryResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      QueryResultsStruct(
        placeId: deserializeParam(
          data['place_id'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QueryResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QueryResultsStruct &&
        placeId == other.placeId &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([placeId, description]);
}

QueryResultsStruct createQueryResultsStruct({
  String? placeId,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QueryResultsStruct(
      placeId: placeId,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QueryResultsStruct? updateQueryResultsStruct(
  QueryResultsStruct? queryResults, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    queryResults
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQueryResultsStructData(
  Map<String, dynamic> firestoreData,
  QueryResultsStruct? queryResults,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (queryResults == null) {
    return;
  }
  if (queryResults.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && queryResults.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final queryResultsData =
      getQueryResultsFirestoreData(queryResults, forFieldValue);
  final nestedData =
      queryResultsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = queryResults.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQueryResultsFirestoreData(
  QueryResultsStruct? queryResults, [
  bool forFieldValue = false,
]) {
  if (queryResults == null) {
    return {};
  }
  final firestoreData = mapToFirestore(queryResults.toMap());

  // Add any Firestore field values
  queryResults.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQueryResultsListFirestoreData(
  List<QueryResultsStruct>? queryResultss,
) =>
    queryResultss?.map((e) => getQueryResultsFirestoreData(e, true)).toList() ??
    [];
