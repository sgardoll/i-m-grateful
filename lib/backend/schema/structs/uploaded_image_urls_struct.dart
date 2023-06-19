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
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _selfie = selfie,
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

  static UploadedImageUrlsStruct fromMap(Map<String, dynamic> data) =>
      UploadedImageUrlsStruct(
        image: data['image'] as String?,
        selfie: data['selfie'] as String?,
      );

  static UploadedImageUrlsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? UploadedImageUrlsStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'selfie': _selfie,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'selfie': serializeParam(
          _selfie,
          ParamType.String,
        ),
      }.withoutNulls;

  static UploadedImageUrlsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UploadedImageUrlsStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        selfie: deserializeParam(
          data['selfie'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UploadedImageUrlsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UploadedImageUrlsStruct &&
        image == other.image &&
        selfie == other.selfie;
  }

  @override
  int get hashCode => const ListEquality().hash([image, selfie]);
}

UploadedImageUrlsStruct createUploadedImageUrlsStruct({
  String? image,
  String? selfie,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UploadedImageUrlsStruct(
      image: image,
      selfie: selfie,
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
