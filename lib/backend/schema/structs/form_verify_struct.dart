// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FormVerifyStruct extends FFFirebaseStruct {
  FormVerifyStruct({
    bool? subur,
    bool? date,
    bool? dropdown,
    bool? dropdown2,
    bool? confirm1,
    bool? confirm2,
    bool? same,
    bool? emailC1,
    bool? emailC2,
    bool? same1,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subur = subur,
        _date = date,
        _dropdown = dropdown,
        _dropdown2 = dropdown2,
        _confirm1 = confirm1,
        _confirm2 = confirm2,
        _same = same,
        _emailC1 = emailC1,
        _emailC2 = emailC2,
        _same1 = same1,
        super(firestoreUtilData);

  // "subur" field.
  bool? _subur;
  bool get subur => _subur ?? true;
  set subur(bool? val) => _subur = val;

  bool hasSubur() => _subur != null;

  // "date" field.
  bool? _date;
  bool get date => _date ?? true;
  set date(bool? val) => _date = val;

  bool hasDate() => _date != null;

  // "dropdown" field.
  bool? _dropdown;
  bool get dropdown => _dropdown ?? true;
  set dropdown(bool? val) => _dropdown = val;

  bool hasDropdown() => _dropdown != null;

  // "dropdown2" field.
  bool? _dropdown2;
  bool get dropdown2 => _dropdown2 ?? true;
  set dropdown2(bool? val) => _dropdown2 = val;

  bool hasDropdown2() => _dropdown2 != null;

  // "confirm1" field.
  bool? _confirm1;
  bool get confirm1 => _confirm1 ?? true;
  set confirm1(bool? val) => _confirm1 = val;

  bool hasConfirm1() => _confirm1 != null;

  // "confirm2" field.
  bool? _confirm2;
  bool get confirm2 => _confirm2 ?? true;
  set confirm2(bool? val) => _confirm2 = val;

  bool hasConfirm2() => _confirm2 != null;

  // "same" field.
  bool? _same;
  bool get same => _same ?? true;
  set same(bool? val) => _same = val;

  bool hasSame() => _same != null;

  // "emailC1" field.
  bool? _emailC1;
  bool get emailC1 => _emailC1 ?? true;
  set emailC1(bool? val) => _emailC1 = val;

  bool hasEmailC1() => _emailC1 != null;

  // "emailC2" field.
  bool? _emailC2;
  bool get emailC2 => _emailC2 ?? true;
  set emailC2(bool? val) => _emailC2 = val;

  bool hasEmailC2() => _emailC2 != null;

  // "same1" field.
  bool? _same1;
  bool get same1 => _same1 ?? true;
  set same1(bool? val) => _same1 = val;

  bool hasSame1() => _same1 != null;

  static FormVerifyStruct fromMap(Map<String, dynamic> data) =>
      FormVerifyStruct(
        subur: data['subur'] as bool?,
        date: data['date'] as bool?,
        dropdown: data['dropdown'] as bool?,
        dropdown2: data['dropdown2'] as bool?,
        confirm1: data['confirm1'] as bool?,
        confirm2: data['confirm2'] as bool?,
        same: data['same'] as bool?,
        emailC1: data['emailC1'] as bool?,
        emailC2: data['emailC2'] as bool?,
        same1: data['same1'] as bool?,
      );

  static FormVerifyStruct? maybeFromMap(dynamic data) => data is Map
      ? FormVerifyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subur': _subur,
        'date': _date,
        'dropdown': _dropdown,
        'dropdown2': _dropdown2,
        'confirm1': _confirm1,
        'confirm2': _confirm2,
        'same': _same,
        'emailC1': _emailC1,
        'emailC2': _emailC2,
        'same1': _same1,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subur': serializeParam(
          _subur,
          ParamType.bool,
        ),
        'date': serializeParam(
          _date,
          ParamType.bool,
        ),
        'dropdown': serializeParam(
          _dropdown,
          ParamType.bool,
        ),
        'dropdown2': serializeParam(
          _dropdown2,
          ParamType.bool,
        ),
        'confirm1': serializeParam(
          _confirm1,
          ParamType.bool,
        ),
        'confirm2': serializeParam(
          _confirm2,
          ParamType.bool,
        ),
        'same': serializeParam(
          _same,
          ParamType.bool,
        ),
        'emailC1': serializeParam(
          _emailC1,
          ParamType.bool,
        ),
        'emailC2': serializeParam(
          _emailC2,
          ParamType.bool,
        ),
        'same1': serializeParam(
          _same1,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FormVerifyStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormVerifyStruct(
        subur: deserializeParam(
          data['subur'],
          ParamType.bool,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.bool,
          false,
        ),
        dropdown: deserializeParam(
          data['dropdown'],
          ParamType.bool,
          false,
        ),
        dropdown2: deserializeParam(
          data['dropdown2'],
          ParamType.bool,
          false,
        ),
        confirm1: deserializeParam(
          data['confirm1'],
          ParamType.bool,
          false,
        ),
        confirm2: deserializeParam(
          data['confirm2'],
          ParamType.bool,
          false,
        ),
        same: deserializeParam(
          data['same'],
          ParamType.bool,
          false,
        ),
        emailC1: deserializeParam(
          data['emailC1'],
          ParamType.bool,
          false,
        ),
        emailC2: deserializeParam(
          data['emailC2'],
          ParamType.bool,
          false,
        ),
        same1: deserializeParam(
          data['same1'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FormVerifyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FormVerifyStruct &&
        subur == other.subur &&
        date == other.date &&
        dropdown == other.dropdown &&
        dropdown2 == other.dropdown2 &&
        confirm1 == other.confirm1 &&
        confirm2 == other.confirm2 &&
        same == other.same &&
        emailC1 == other.emailC1 &&
        emailC2 == other.emailC2 &&
        same1 == other.same1;
  }

  @override
  int get hashCode => const ListEquality().hash([
        subur,
        date,
        dropdown,
        dropdown2,
        confirm1,
        confirm2,
        same,
        emailC1,
        emailC2,
        same1
      ]);
}

FormVerifyStruct createFormVerifyStruct({
  bool? subur,
  bool? date,
  bool? dropdown,
  bool? dropdown2,
  bool? confirm1,
  bool? confirm2,
  bool? same,
  bool? emailC1,
  bool? emailC2,
  bool? same1,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FormVerifyStruct(
      subur: subur,
      date: date,
      dropdown: dropdown,
      dropdown2: dropdown2,
      confirm1: confirm1,
      confirm2: confirm2,
      same: same,
      emailC1: emailC1,
      emailC2: emailC2,
      same1: same1,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FormVerifyStruct? updateFormVerifyStruct(
  FormVerifyStruct? formVerify, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    formVerify
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFormVerifyStructData(
  Map<String, dynamic> firestoreData,
  FormVerifyStruct? formVerify,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (formVerify == null) {
    return;
  }
  if (formVerify.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && formVerify.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final formVerifyData = getFormVerifyFirestoreData(formVerify, forFieldValue);
  final nestedData = formVerifyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = formVerify.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFormVerifyFirestoreData(
  FormVerifyStruct? formVerify, [
  bool forFieldValue = false,
]) {
  if (formVerify == null) {
    return {};
  }
  final firestoreData = mapToFirestore(formVerify.toMap());

  // Add any Firestore field values
  formVerify.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFormVerifyListFirestoreData(
  List<FormVerifyStruct>? formVerifys,
) =>
    formVerifys?.map((e) => getFormVerifyFirestoreData(e, true)).toList() ?? [];
