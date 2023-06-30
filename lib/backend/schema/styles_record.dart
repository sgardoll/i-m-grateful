import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StylesRecord extends FirestoreRecord {
  StylesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  bool hasStyle() => _style != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _style = snapshotData['style'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('styles');

  static Stream<StylesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StylesRecord.fromSnapshot(s));

  static Future<StylesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StylesRecord.fromSnapshot(s));

  static StylesRecord fromSnapshot(DocumentSnapshot snapshot) => StylesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StylesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StylesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StylesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StylesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStylesRecordData({
  String? style,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'style': style,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class StylesRecordDocumentEquality implements Equality<StylesRecord> {
  const StylesRecordDocumentEquality();

  @override
  bool equals(StylesRecord? e1, StylesRecord? e2) {
    return e1?.style == e2?.style && e1?.image == e2?.image;
  }

  @override
  int hash(StylesRecord? e) => const ListEquality().hash([e?.style, e?.image]);

  @override
  bool isValidKey(Object? o) => o is StylesRecord;
}
