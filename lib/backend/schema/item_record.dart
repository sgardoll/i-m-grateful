import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemRecord extends FirestoreRecord {
  ItemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "itemText" field.
  String? _itemText;
  String get itemText => _itemText ?? '';
  bool hasItemText() => _itemText != null;

  // "moreText" field.
  String? _moreText;
  String get moreText => _moreText ?? '';
  bool hasMoreText() => _moreText != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "selfie" field.
  String? _selfie;
  String get selfie => _selfie ?? '';
  bool hasSelfie() => _selfie != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  bool hasStyle() => _style != null;

  // "stable" field.
  StableStruct? _stable;
  StableStruct get stable => _stable ?? StableStruct();
  bool hasStable() => _stable != null;

  // "contrastingColor" field.
  String? _contrastingColor;
  String get contrastingColor => _contrastingColor ?? '';
  bool hasContrastingColor() => _contrastingColor != null;

  // "darkVibrant" field.
  String? _darkVibrant;
  String get darkVibrant => _darkVibrant ?? '';
  bool hasDarkVibrant() => _darkVibrant != null;

  // "lightVibrant" field.
  String? _lightVibrant;
  String get lightVibrant => _lightVibrant ?? '';
  bool hasLightVibrant() => _lightVibrant != null;

  // "primaryColor" field.
  String? _primaryColor;
  String get primaryColor => _primaryColor ?? '';
  bool hasPrimaryColor() => _primaryColor != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "uploadedImages" field.
  UploadedImageUrlsStruct? _uploadedImages;
  UploadedImageUrlsStruct get uploadedImages =>
      _uploadedImages ?? UploadedImageUrlsStruct();
  bool hasUploadedImages() => _uploadedImages != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "replicateSelfieEdgeOfRealismV20Img2Img" field.
  List<String>? _replicateSelfieEdgeOfRealismV20Img2Img;
  List<String> get replicateSelfieEdgeOfRealismV20Img2Img =>
      _replicateSelfieEdgeOfRealismV20Img2Img ?? const [];
  bool hasReplicateSelfieEdgeOfRealismV20Img2Img() =>
      _replicateSelfieEdgeOfRealismV20Img2Img != null;

  // "edge-of-realism-v20-img2img" field.
  String? _edgeOfRealismV20Img2img;
  String get edgeOfRealismV20Img2img => _edgeOfRealismV20Img2img ?? '';
  bool hasEdgeOfRealismV20Img2img() => _edgeOfRealismV20Img2img != null;

  // "replicateNoBgCreate" field.
  String? _replicateNoBgCreate;
  String get replicateNoBgCreate => _replicateNoBgCreate ?? '';
  bool hasReplicateNoBgCreate() => _replicateNoBgCreate != null;

  // "instructPix2Pix" field.
  String? _instructPix2Pix;
  String get instructPix2Pix => _instructPix2Pix ?? '';
  bool hasInstructPix2Pix() => _instructPix2Pix != null;

  // "stableImg2Img" field.
  String? _stableImg2Img;
  String get stableImg2Img => _stableImg2Img ?? '';
  bool hasStableImg2Img() => _stableImg2Img != null;

  // "mainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  bool hasMainImage() => _mainImage != null;

  void _initializeFields() {
    _itemText = snapshotData['itemText'] as String?;
    _moreText = snapshotData['moreText'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _photo = snapshotData['photo'] as String?;
    _selfie = snapshotData['selfie'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _style = snapshotData['style'] as String?;
    _stable = StableStruct.maybeFromMap(snapshotData['stable']);
    _contrastingColor = snapshotData['contrastingColor'] as String?;
    _darkVibrant = snapshotData['darkVibrant'] as String?;
    _lightVibrant = snapshotData['lightVibrant'] as String?;
    _primaryColor = snapshotData['primaryColor'] as String?;
    _status = snapshotData['status'] as String?;
    _uploadedImages =
        UploadedImageUrlsStruct.maybeFromMap(snapshotData['uploadedImages']);
    _gender = snapshotData['gender'] as String?;
    _replicateSelfieEdgeOfRealismV20Img2Img =
        getDataList(snapshotData['replicateSelfieEdgeOfRealismV20Img2Img']);
    _edgeOfRealismV20Img2img =
        snapshotData['edge-of-realism-v20-img2img'] as String?;
    _replicateNoBgCreate = snapshotData['replicateNoBgCreate'] as String?;
    _instructPix2Pix = snapshotData['instructPix2Pix'] as String?;
    _stableImg2Img = snapshotData['stableImg2Img'] as String?;
    _mainImage = snapshotData['mainImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Item');

  static Stream<ItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemRecord.fromSnapshot(s));

  static Future<ItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemRecord.fromSnapshot(s));

  static ItemRecord fromSnapshot(DocumentSnapshot snapshot) => ItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemRecordData({
  String? itemText,
  String? moreText,
  LatLng? location,
  String? photo,
  String? selfie,
  DateTime? timestamp,
  DocumentReference? userRef,
  String? style,
  StableStruct? stable,
  String? contrastingColor,
  String? darkVibrant,
  String? lightVibrant,
  String? primaryColor,
  String? status,
  UploadedImageUrlsStruct? uploadedImages,
  String? gender,
  String? edgeOfRealismV20Img2img,
  String? replicateNoBgCreate,
  String? instructPix2Pix,
  String? stableImg2Img,
  String? mainImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'itemText': itemText,
      'moreText': moreText,
      'location': location,
      'photo': photo,
      'selfie': selfie,
      'timestamp': timestamp,
      'userRef': userRef,
      'style': style,
      'stable': StableStruct().toMap(),
      'contrastingColor': contrastingColor,
      'darkVibrant': darkVibrant,
      'lightVibrant': lightVibrant,
      'primaryColor': primaryColor,
      'status': status,
      'uploadedImages': UploadedImageUrlsStruct().toMap(),
      'gender': gender,
      'edge-of-realism-v20-img2img': edgeOfRealismV20Img2img,
      'replicateNoBgCreate': replicateNoBgCreate,
      'instructPix2Pix': instructPix2Pix,
      'stableImg2Img': stableImg2Img,
      'mainImage': mainImage,
    }.withoutNulls,
  );

  // Handle nested data for "stable" field.
  addStableStructData(firestoreData, stable, 'stable');

  // Handle nested data for "uploadedImages" field.
  addUploadedImageUrlsStructData(
      firestoreData, uploadedImages, 'uploadedImages');

  return firestoreData;
}

class ItemRecordDocumentEquality implements Equality<ItemRecord> {
  const ItemRecordDocumentEquality();

  @override
  bool equals(ItemRecord? e1, ItemRecord? e2) {
    const listEquality = ListEquality();
    return e1?.itemText == e2?.itemText &&
        e1?.moreText == e2?.moreText &&
        e1?.location == e2?.location &&
        e1?.photo == e2?.photo &&
        e1?.selfie == e2?.selfie &&
        e1?.timestamp == e2?.timestamp &&
        e1?.userRef == e2?.userRef &&
        e1?.style == e2?.style &&
        e1?.stable == e2?.stable &&
        e1?.contrastingColor == e2?.contrastingColor &&
        e1?.darkVibrant == e2?.darkVibrant &&
        e1?.lightVibrant == e2?.lightVibrant &&
        e1?.primaryColor == e2?.primaryColor &&
        e1?.status == e2?.status &&
        e1?.uploadedImages == e2?.uploadedImages &&
        e1?.gender == e2?.gender &&
        listEquality.equals(e1?.replicateSelfieEdgeOfRealismV20Img2Img,
            e2?.replicateSelfieEdgeOfRealismV20Img2Img) &&
        e1?.edgeOfRealismV20Img2img == e2?.edgeOfRealismV20Img2img &&
        e1?.replicateNoBgCreate == e2?.replicateNoBgCreate &&
        e1?.instructPix2Pix == e2?.instructPix2Pix &&
        e1?.stableImg2Img == e2?.stableImg2Img &&
        e1?.mainImage == e2?.mainImage;
  }

  @override
  int hash(ItemRecord? e) => const ListEquality().hash([
        e?.itemText,
        e?.moreText,
        e?.location,
        e?.photo,
        e?.selfie,
        e?.timestamp,
        e?.userRef,
        e?.style,
        e?.stable,
        e?.contrastingColor,
        e?.darkVibrant,
        e?.lightVibrant,
        e?.primaryColor,
        e?.status,
        e?.uploadedImages,
        e?.gender,
        e?.replicateSelfieEdgeOfRealismV20Img2Img,
        e?.edgeOfRealismV20Img2img,
        e?.replicateNoBgCreate,
        e?.instructPix2Pix,
        e?.stableImg2Img,
        e?.mainImage
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemRecord;
}
