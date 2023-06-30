// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StableStruct extends FFFirebaseStruct {
  StableStruct({
    ColorPalettesStruct? colorPalettes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _colorPalettes = colorPalettes,
        super(firestoreUtilData);

  // "colorPalettes" field.
  ColorPalettesStruct? _colorPalettes;
  ColorPalettesStruct get colorPalettes =>
      _colorPalettes ?? ColorPalettesStruct();
  set colorPalettes(ColorPalettesStruct? val) => _colorPalettes = val;
  void updateColorPalettes(Function(ColorPalettesStruct) updateFn) =>
      updateFn(_colorPalettes ??= ColorPalettesStruct());
  bool hasColorPalettes() => _colorPalettes != null;

  static StableStruct fromMap(Map<String, dynamic> data) => StableStruct(
        colorPalettes: ColorPalettesStruct.maybeFromMap(data['colorPalettes']),
      );

  static StableStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? StableStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'colorPalettes': _colorPalettes?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'colorPalettes': serializeParam(
          _colorPalettes,
          ParamType.DataStruct,
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
      );

  @override
  String toString() => 'StableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StableStruct && colorPalettes == other.colorPalettes;
  }

  @override
  int get hashCode => const ListEquality().hash([colorPalettes]);
}

StableStruct createStableStruct({
  ColorPalettesStruct? colorPalettes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StableStruct(
      colorPalettes: colorPalettes ?? ColorPalettesStruct(),
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
