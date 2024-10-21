import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "firts_name" field.
  String? _firtsName;
  String get firtsName => _firtsName ?? '';
  bool hasFirtsName() => _firtsName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "suburb" field.
  LatLng? _suburb;
  LatLng? get suburb => _suburb;
  bool hasSuburb() => _suburb != null;

  // "ndis" field.
  String? _ndis;
  String get ndis => _ndis ?? '';
  bool hasNdis() => _ndis != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  bool hasBirthdate() => _birthdate != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "comapny" field.
  String? _comapny;
  String get comapny => _comapny ?? '';
  bool hasComapny() => _comapny != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "languagues" field.
  String? _languagues;
  String get languagues => _languagues ?? '';
  bool hasLanguagues() => _languagues != null;

  // "years" field.
  int? _years;
  int get years => _years ?? 0;
  bool hasYears() => _years != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "plan" field.
  Plan? _plan;
  Plan? get plan => _plan;
  bool hasPlan() => _plan != null;

  // "rol" field.
  Roles? _rol;
  Roles? get rol => _rol;
  bool hasRol() => _rol != null;

  // "favorites" field.
  List<DocumentReference>? _favorites;
  List<DocumentReference> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "business" field.
  DocumentReference? _business;
  DocumentReference? get business => _business;
  bool hasBusiness() => _business != null;

  // "professionals" field.
  List<DocumentReference>? _professionals;
  List<DocumentReference> get professionals => _professionals ?? const [];
  bool hasProfessionals() => _professionals != null;

  // "update_time" field.
  DateTime? _updateTime;
  DateTime? get updateTime => _updateTime;
  bool hasUpdateTime() => _updateTime != null;

  // "serviceType" field.
  List<String>? _serviceType;
  List<String> get serviceType => _serviceType ?? const [];
  bool hasServiceType() => _serviceType != null;

  // "dontShow" field.
  List<DocumentReference>? _dontShow;
  List<DocumentReference> get dontShow => _dontShow ?? const [];
  bool hasDontShow() => _dontShow != null;

  // "blockList" field.
  List<DocumentReference>? _blockList;
  List<DocumentReference> get blockList => _blockList ?? const [];
  bool hasBlockList() => _blockList != null;

  // "blockUser" field.
  List<DocumentReference>? _blockUser;
  List<DocumentReference> get blockUser => _blockUser ?? const [];
  bool hasBlockUser() => _blockUser != null;

  // "freeTrial" field.
  bool? _freeTrial;
  bool get freeTrial => _freeTrial ?? false;
  bool hasFreeTrial() => _freeTrial != null;

  // "paymentDate" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "isFreeTrialFInish" field.
  bool? _isFreeTrialFInish;
  bool get isFreeTrialFInish => _isFreeTrialFInish ?? false;
  bool hasIsFreeTrialFInish() => _isFreeTrialFInish != null;

  // "firtsLogin" field.
  bool? _firtsLogin;
  bool get firtsLogin => _firtsLogin ?? false;
  bool hasFirtsLogin() => _firtsLogin != null;

  // "disabilities" field.
  List<String>? _disabilities;
  List<String> get disabilities => _disabilities ?? const [];
  bool hasDisabilities() => _disabilities != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "schedule" field.
  List<String>? _schedule;
  List<String> get schedule => _schedule ?? const [];
  bool hasSchedule() => _schedule != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _firtsName = snapshotData['firts_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _suburb = snapshotData['suburb'] as LatLng?;
    _ndis = snapshotData['ndis'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthdate = snapshotData['birthdate'] as DateTime?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _comapny = snapshotData['comapny'] as String?;
    _age = snapshotData['age'] as String?;
    _languagues = snapshotData['languagues'] as String?;
    _years = castToType<int>(snapshotData['years']);
    _gender = snapshotData['gender'] as String?;
    _images = getDataList(snapshotData['images']);
    _description = snapshotData['description'] as String?;
    _plan = deserializeEnum<Plan>(snapshotData['plan']);
    _rol = deserializeEnum<Roles>(snapshotData['rol']);
    _favorites = getDataList(snapshotData['favorites']);
    _business = snapshotData['business'] as DocumentReference?;
    _professionals = getDataList(snapshotData['professionals']);
    _updateTime = snapshotData['update_time'] as DateTime?;
    _serviceType = getDataList(snapshotData['serviceType']);
    _dontShow = getDataList(snapshotData['dontShow']);
    _blockList = getDataList(snapshotData['blockList']);
    _blockUser = getDataList(snapshotData['blockUser']);
    _freeTrial = snapshotData['freeTrial'] as bool?;
    _paymentDate = snapshotData['paymentDate'] as DateTime?;
    _isFreeTrialFInish = snapshotData['isFreeTrialFInish'] as bool?;
    _firtsLogin = snapshotData['firtsLogin'] as bool?;
    _disabilities = getDataList(snapshotData['disabilities']);
    _video = snapshotData['video'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _schedule = getDataList(snapshotData['schedule']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? firtsName,
  String? lastName,
  LatLng? suburb,
  String? ndis,
  String? phoneNumber,
  DateTime? birthdate,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? comapny,
  String? age,
  String? languagues,
  int? years,
  String? gender,
  String? description,
  Plan? plan,
  Roles? rol,
  DocumentReference? business,
  DateTime? updateTime,
  bool? freeTrial,
  DateTime? paymentDate,
  bool? isFreeTrialFInish,
  bool? firtsLogin,
  String? video,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'firts_name': firtsName,
      'last_name': lastName,
      'suburb': suburb,
      'ndis': ndis,
      'phone_number': phoneNumber,
      'birthdate': birthdate,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'comapny': comapny,
      'age': age,
      'languagues': languagues,
      'years': years,
      'gender': gender,
      'description': description,
      'plan': plan,
      'rol': rol,
      'business': business,
      'update_time': updateTime,
      'freeTrial': freeTrial,
      'paymentDate': paymentDate,
      'isFreeTrialFInish': isFreeTrialFInish,
      'firtsLogin': firtsLogin,
      'video': video,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.firtsName == e2?.firtsName &&
        e1?.lastName == e2?.lastName &&
        e1?.suburb == e2?.suburb &&
        e1?.ndis == e2?.ndis &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthdate == e2?.birthdate &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.comapny == e2?.comapny &&
        e1?.age == e2?.age &&
        e1?.languagues == e2?.languagues &&
        e1?.years == e2?.years &&
        e1?.gender == e2?.gender &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.description == e2?.description &&
        e1?.plan == e2?.plan &&
        e1?.rol == e2?.rol &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        e1?.business == e2?.business &&
        listEquality.equals(e1?.professionals, e2?.professionals) &&
        e1?.updateTime == e2?.updateTime &&
        listEquality.equals(e1?.serviceType, e2?.serviceType) &&
        listEquality.equals(e1?.dontShow, e2?.dontShow) &&
        listEquality.equals(e1?.blockList, e2?.blockList) &&
        listEquality.equals(e1?.blockUser, e2?.blockUser) &&
        e1?.freeTrial == e2?.freeTrial &&
        e1?.paymentDate == e2?.paymentDate &&
        e1?.isFreeTrialFInish == e2?.isFreeTrialFInish &&
        e1?.firtsLogin == e2?.firtsLogin &&
        listEquality.equals(e1?.disabilities, e2?.disabilities) &&
        e1?.video == e2?.video &&
        e1?.isActive == e2?.isActive &&
        listEquality.equals(e1?.schedule, e2?.schedule);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.firtsName,
        e?.lastName,
        e?.suburb,
        e?.ndis,
        e?.phoneNumber,
        e?.birthdate,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.comapny,
        e?.age,
        e?.languagues,
        e?.years,
        e?.gender,
        e?.images,
        e?.description,
        e?.plan,
        e?.rol,
        e?.favorites,
        e?.business,
        e?.professionals,
        e?.updateTime,
        e?.serviceType,
        e?.dontShow,
        e?.blockList,
        e?.blockUser,
        e?.freeTrial,
        e?.paymentDate,
        e?.isFreeTrialFInish,
        e?.firtsLogin,
        e?.disabilities,
        e?.video,
        e?.isActive,
        e?.schedule
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
