// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseNameStruct extends FFFirebaseStruct {
  ResponseNameStruct({
    List<String>? names,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _names = names,
        super(firestoreUtilData);

  // "names" field.
  List<String>? _names;
  List<String> get names => _names ?? const [];
  set names(List<String>? val) => _names = val;

  void updateNames(Function(List<String>) updateFn) {
    updateFn(_names ??= []);
  }

  bool hasNames() => _names != null;

  static ResponseNameStruct fromMap(Map<String, dynamic> data) =>
      ResponseNameStruct(
        names: getDataList(data['names']),
      );

  static ResponseNameStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponseNameStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'names': _names,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'names': serializeParam(
          _names,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ResponseNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponseNameStruct(
        names: deserializeParam<String>(
          data['names'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ResponseNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponseNameStruct &&
        listEquality.equals(names, other.names);
  }

  @override
  int get hashCode => const ListEquality().hash([names]);
}

ResponseNameStruct createResponseNameStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseNameStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseNameStruct? updateResponseNameStruct(
  ResponseNameStruct? responseName, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responseName
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseNameStructData(
  Map<String, dynamic> firestoreData,
  ResponseNameStruct? responseName,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responseName == null) {
    return;
  }
  if (responseName.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responseName.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseNameData =
      getResponseNameFirestoreData(responseName, forFieldValue);
  final nestedData =
      responseNameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responseName.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseNameFirestoreData(
  ResponseNameStruct? responseName, [
  bool forFieldValue = false,
]) {
  if (responseName == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responseName.toMap());

  // Add any Firestore field values
  responseName.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseNameListFirestoreData(
  List<ResponseNameStruct>? responseNames,
) =>
    responseNames?.map((e) => getResponseNameFirestoreData(e, true)).toList() ??
    [];
