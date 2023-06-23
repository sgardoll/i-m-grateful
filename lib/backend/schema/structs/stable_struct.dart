// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StableStruct extends FFFirebaseStruct {
  StableStruct({
    ColorPalettesStruct? colorPalettes,
    List<String>? imageUrls,
    DocumentReference? userRef,
    String? style,
    DateTime? timestamp,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _colorPalettes = colorPalettes,
        _imageUrls = imageUrls,
        _userRef = userRef,
        _style = style,
        _timestamp = timestamp,
        _status = status,
        super(firestoreUtilData);

  // "colorPalettes" field.
  ColorPalettesStruct? _colorPalettes;
  ColorPalettesStruct get colorPalettes =>
      _colorPalettes ?? ColorPalettesStruct();
  set colorPalettes(ColorPalettesStruct? val) => _colorPalettes = val;
  void updateColorPalettes(Function(ColorPalettesStruct) updateFn) =>
      updateFn(_colorPalettes ??= ColorPalettesStruct());
  bool hasColorPalettes() => _colorPalettes != null;

  // "imageUrls" field.
  List<String>? _imageUrls;
  List<String> get imageUrls => _imageUrls ?? const [];
  set imageUrls(List<String>? val) => _imageUrls = val;
  void updateImageUrls(Function(List<String>) updateFn) =>
      updateFn(_imageUrls ??= []);
  bool hasImageUrls() => _imageUrls != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;
  bool hasUserRef() => _userRef != null;

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  set style(String? val) => _style = val;
  bool hasStyle() => _style != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  static StableStruct fromMap(Map<String, dynamic> data) => StableStruct(
        colorPalettes: ColorPalettesStruct.maybeFromMap(data['colorPalettes']),
        imageUrls: getDataList(data['imageUrls']),
        userRef: data['userRef'] as DocumentReference?,
        style: data['style'] as String?,
        timestamp: data['timestamp'] as DateTime?,
        status: data['status'] as String?,
      );

  static StableStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? StableStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'colorPalettes': _colorPalettes?.toMap(),
        'imageUrls': _imageUrls,
        'userRef': _userRef,
        'style': _style,
        'timestamp': _timestamp,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'colorPalettes': serializeParam(
          _colorPalettes,
          ParamType.DataStruct,
        ),
        'imageUrls': serializeParam(
          _imageUrls,
          ParamType.String,
          true,
        ),
        'userRef': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'style': serializeParam(
          _style,
          ParamType.String,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static StableStruct fromSerializableMap(Map<String, dynamic> data) =>
      StableStruct(
        colorPalettes: deserializeStructParam(
          data['colorPalettes'],
          ParamType.DataStruct,
          false,
          structBuilder: ColorPalettesStruct.fromSerializableMap,
        ),
        imageUrls: deserializeParam<String>(
          data['imageUrls'],
          ParamType.String,
          true,
        ),
        userRef: deserializeParam(
          data['userRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
        style: deserializeParam(
          data['style'],
          ParamType.String,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StableStruct &&
        colorPalettes == other.colorPalettes &&
        listEquality.equals(imageUrls, other.imageUrls) &&
        userRef == other.userRef &&
        style == other.style &&
        timestamp == other.timestamp &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([colorPalettes, imageUrls, userRef, style, timestamp, status]);
}

StableStruct createStableStruct({
  ColorPalettesStruct? colorPalettes,
  DocumentReference? userRef,
  String? style,
  DateTime? timestamp,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StableStruct(
      colorPalettes: colorPalettes ?? ColorPalettesStruct(),
      userRef: userRef,
      style: style,
      timestamp: timestamp,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StableStruct? updateStableStruct(
  StableStruct? stable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStableStructData(
  Map<String, dynamic> firestoreData,
  StableStruct? stable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stable == null) {
    return;
  }
  if (stable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && stable.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stableData = getStableFirestoreData(stable, forFieldValue);
  final nestedData = stableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = stable.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStableFirestoreData(
  StableStruct? stable, [
  bool forFieldValue = false,
]) {
  if (stable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stable.toMap());

  // Handle nested data for "colorPalettes" field.
  addColorPalettesStructData(
      firestoreData, stable.colorPalettes, 'colorPalettes', forFieldValue);

  // Add any Firestore field values
  stable.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStableListFirestoreData(
  List<StableStruct>? stables,
) =>
    stables?.map((e) => getStableFirestoreData(e, true)).toList() ?? [];
