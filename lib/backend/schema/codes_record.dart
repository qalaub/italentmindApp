import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CodesRecord extends FirestoreRecord {
  CodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "business" field.
  DocumentReference? _business;
  DocumentReference? get business => _business;
  bool hasBusiness() => _business != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _business = snapshotData['business'] as DocumentReference?;
    _code = snapshotData['code'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('codes');

  static Stream<CodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CodesRecord.fromSnapshot(s));

  static Future<CodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CodesRecord.fromSnapshot(s));

  static CodesRecord fromSnapshot(DocumentSnapshot snapshot) => CodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCodesRecordData({
  DocumentReference? business,
  String? code,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business': business,
      'code': code,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class CodesRecordDocumentEquality implements Equality<CodesRecord> {
  const CodesRecordDocumentEquality();

  @override
  bool equals(CodesRecord? e1, CodesRecord? e2) {
    return e1?.business == e2?.business &&
        e1?.code == e2?.code &&
        e1?.name == e2?.name;
  }

  @override
  int hash(CodesRecord? e) =>
      const ListEquality().hash([e?.business, e?.code, e?.name]);

  @override
  bool isValidKey(Object? o) => o is CodesRecord;
}
