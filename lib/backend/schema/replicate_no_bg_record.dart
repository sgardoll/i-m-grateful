import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReplicateNoBgRecord extends FirestoreRecord {
  ReplicateNoBgRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('replicateNoBg');

  static Stream<ReplicateNoBgRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReplicateNoBgRecord.fromSnapshot(s));

  static Future<ReplicateNoBgRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReplicateNoBgRecord.fromSnapshot(s));

  static ReplicateNoBgRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReplicateNoBgRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReplicateNoBgRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReplicateNoBgRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReplicateNoBgRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReplicateNoBgRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReplicateNoBgRecordData({
  String? id,
  DocumentReference? userRef,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'userRef': userRef,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}
