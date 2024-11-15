import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsbusinessRecord extends FirestoreRecord {
  NewsbusinessRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "business" field.
  DocumentReference? _business;
  DocumentReference? get business => _business;
  bool hasBusiness() => _business != null;

  // "professional" field.
  DocumentReference? _professional;
  DocumentReference? get professional => _professional;
  bool hasProfessional() => _professional != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "isView" field.
  bool? _isView;
  bool get isView => _isView ?? false;
  bool hasIsView() => _isView != null;

  void _initializeFields() {
    _business = snapshotData['business'] as DocumentReference?;
    _professional = snapshotData['professional'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _isView = snapshotData['isView'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('newsbusiness');

  static Stream<NewsbusinessRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsbusinessRecord.fromSnapshot(s));

  static Future<NewsbusinessRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsbusinessRecord.fromSnapshot(s));

  static NewsbusinessRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewsbusinessRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsbusinessRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsbusinessRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsbusinessRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsbusinessRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsbusinessRecordData({
  DocumentReference? business,
  DocumentReference? professional,
  DocumentReference? user,
  bool? isView,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'business': business,
      'professional': professional,
      'user': user,
      'isView': isView,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsbusinessRecordDocumentEquality
    implements Equality<NewsbusinessRecord> {
  const NewsbusinessRecordDocumentEquality();

  @override
  bool equals(NewsbusinessRecord? e1, NewsbusinessRecord? e2) {
    return e1?.business == e2?.business &&
        e1?.professional == e2?.professional &&
        e1?.user == e2?.user &&
        e1?.isView == e2?.isView;
  }

  @override
  int hash(NewsbusinessRecord? e) => const ListEquality()
      .hash([e?.business, e?.professional, e?.user, e?.isView]);

  @override
  bool isValidKey(Object? o) => o is NewsbusinessRecord;
}
