// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UploadedImageUrlsStruct extends FFFirebaseStruct {
  UploadedImageUrlsStruct({
    String? image,
    String? selfie,
    String? stablePhoto,
    String? stableSelfie,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _selfie = selfie,
        _stablePhoto = stablePhoto,
        _stableSelfie = stableSelfie,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "selfie" field.
  String? _selfie;
  String get selfie => _selfie ?? '';
  set selfie(String? val) => _selfie = val;
  bool hasSelfie() => _selfie != null;

  // "stablePhoto" field.
  String? _stablePhoto;
  String get stablePhoto => _stablePhoto ?? '';
  set stablePhoto(String? val) => _stablePhoto = val;
  bool hasStablePhoto() => _stablePhoto != null;

  // "stableSelfie" field.
  String? _stableSelfie;
  String get stableSelfie => _stableSelfie ?? '';
  set stableSelfie(String? val) => _stableSelfie = val;
  bool hasStableSelfie() => _stableSelfie != null;

  static UploadedImageUrlsStruct fromMap(Map<String, dynamic> data) =>
      UploadedImageUrlsStruct(
        image: data['image'] as String?,
        selfie: data['selfie'] as String?,
        stablePhoto: data['stablePhoto'] as String?,
        stableSelfie: data['stableSelfie'] as String?,
      );

  static UploadedImageUrlsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? UploadedImageUrlsStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'selfie': _selfie,
        'stablePhoto': _stablePhoto,
        'stableSelfie': _stableSelfie,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static UploadedImageUrlsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'UploadedImageUrlsStruct(${toMap()})';
}

UploadedImageUrlsStruct createUploadedImageUrlsStruct({
  String? image,
  String? selfie,
  String? stablePhoto,
  String? stableSelfie,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadedImageUrlsStruct(
      image: image,
      selfie: selfie,
      stablePhoto: stablePhoto,
      stableSelfie: stableSelfie,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UploadedImageUrlsStruct? updateUploadedImageUrlsStruct(
  UploadedImageUrlsStruct? uploadedImageUrls, {
  bool clearUnsetFields = true,
}) =>
    uploadedImageUrls
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addUploadedImageUrlsStructData(
  Map<String, dynamic> firestoreData,
  UploadedImageUrlsStruct? uploadedImageUrls,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (uploadedImageUrls == null) {
    return;
  }
  if (uploadedImageUrls.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && uploadedImageUrls.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final uploadedImageUrlsData =
      getUploadedImageUrlsFirestoreData(uploadedImageUrls, forFieldValue);
  final nestedData =
      uploadedImageUrlsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = uploadedImageUrls.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUploadedImageUrlsFirestoreData(
  UploadedImageUrlsStruct? uploadedImageUrls, [
  bool forFieldValue = false,
]) {
  if (uploadedImageUrls == null) {
    return {};
  }
  final firestoreData = mapToFirestore(uploadedImageUrls.toMap());

  // Add any Firestore field values
  uploadedImageUrls.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUploadedImageUrlsListFirestoreData(
  List<UploadedImageUrlsStruct>? uploadedImageUrlss,
) =>
    uploadedImageUrlss
        ?.map((e) => getUploadedImageUrlsFirestoreData(e, true))
        .toList() ??
    [];
