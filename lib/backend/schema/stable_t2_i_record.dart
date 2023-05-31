import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StableT2IRecord extends FirestoreRecord {
  StableT2IRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemRef" field.
  DocumentReference? _itemRef;
  DocumentReference? get itemRef => _itemRef;
  bool hasItemRef() => _itemRef != null;

  void _initializeFields() {
    _itemRef = snapshotData['itemRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stableT2I');

  static Stream<StableT2IRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StableT2IRecord.fromSnapshot(s));

  static Future<StableT2IRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StableT2IRecord.fromSnapshot(s));

  static StableT2IRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StableT2IRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StableT2IRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StableT2IRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StableT2IRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createStableT2IRecordData({
  DocumentReference? itemRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemRef': itemRef,
    }.withoutNulls,
  );

  return firestoreData;
}
