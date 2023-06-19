import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomStylesRecord extends FirestoreRecord {
  CustomStylesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  bool hasStyle() => _style != null;

  // "stableT2I" field.
  List<String>? _stableT2I;
  List<String> get stableT2I => _stableT2I ?? const [];
  bool hasStableT2I() => _stableT2I != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _style = snapshotData['style'] as String?;
    _stableT2I = getDataList(snapshotData['stableT2I']);
    _image = snapshotData['image'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customStyles');

  static Stream<CustomStylesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomStylesRecord.fromSnapshot(s));

  static Future<CustomStylesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomStylesRecord.fromSnapshot(s));

  static CustomStylesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomStylesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomStylesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomStylesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomStylesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomStylesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomStylesRecordData({
  String? style,
  String? image,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'style': style,
      'image': image,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}
