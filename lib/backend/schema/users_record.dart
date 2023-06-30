import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "FullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "premium" field.
  bool? _premium;
  bool get premium => _premium ?? false;
  bool hasPremium() => _premium != null;

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  bool hasStyle() => _style != null;

  // "settings" field.
  SettingsStruct? _settings;
  SettingsStruct get settings => _settings ?? SettingsStruct();
  bool hasSettings() => _settings != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  void _initializeFields() {
    _password = snapshotData['Password'] as String?;
    _fullName = snapshotData['FullName'] as String?;
    _uid = snapshotData['uid'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _premium = snapshotData['premium'] as bool?;
    _style = snapshotData['style'] as String?;
    _settings = SettingsStruct.maybeFromMap(snapshotData['settings']);
    _gender = snapshotData['gender'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Users');

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
  String? password,
  String? fullName,
  String? uid,
  String? email,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? photoUrl,
  bool? premium,
  String? style,
  SettingsStruct? settings,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Password': password,
      'FullName': fullName,
      'uid': uid,
      'email': email,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'premium': premium,
      'style': style,
      'settings': SettingsStruct().toMap(),
      'gender': gender,
    }.withoutNulls,
  );

  // Handle nested data for "settings" field.
  addSettingsStructData(firestoreData, settings, 'settings');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.password == e2?.password &&
        e1?.fullName == e2?.fullName &&
        e1?.uid == e2?.uid &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.premium == e2?.premium &&
        e1?.style == e2?.style &&
        e1?.settings == e2?.settings &&
        e1?.gender == e2?.gender;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.password,
        e?.fullName,
        e?.uid,
        e?.email,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.photoUrl,
        e?.premium,
        e?.style,
        e?.settings,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
