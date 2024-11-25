import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "num" field.
  int? _num;
  int get num => _num ?? 0;
  bool hasNum() => _num != null;

  // "professional" field.
  DocumentReference? _professional;
  DocumentReference? get professional => _professional;
  bool hasProfessional() => _professional != null;

  // "participant" field.
  DocumentReference? _participant;
  DocumentReference? get participant => _participant;
  bool hasParticipant() => _participant != null;

  void _initializeFields() {
    _num = castToType<int>(snapshotData['num']);
    _professional = snapshotData['professional'] as DocumentReference?;
    _participant = snapshotData['participant'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  int? num,
  DocumentReference? professional,
  DocumentReference? participant,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'num': num,
      'professional': professional,
      'participant': participant,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.num == e2?.num &&
        e1?.professional == e2?.professional &&
        e1?.participant == e2?.participant;
  }

  @override
  int hash(ReviewsRecord? e) =>
      const ListEquality().hash([e?.num, e?.professional, e?.participant]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
