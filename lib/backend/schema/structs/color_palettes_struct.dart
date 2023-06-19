// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorPalettesStruct extends FFFirebaseStruct {
  ColorPalettesStruct({
    Color? primaryColor,
    Color? contrastingColor,
    Color? lightVibrant,
    Color? darkVibrant,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _primaryColor = primaryColor,
        _contrastingColor = contrastingColor,
        _lightVibrant = lightVibrant,
        _darkVibrant = darkVibrant,
        super(firestoreUtilData);

  // "primaryColor" field.
  Color? _primaryColor;
  Color? get primaryColor => _primaryColor;
  set primaryColor(Color? val) => _primaryColor = val;
  bool hasPrimaryColor() => _primaryColor != null;

  // "contrastingColor" field.
  Color? _contrastingColor;
  Color? get contrastingColor => _contrastingColor;
  set contrastingColor(Color? val) => _contrastingColor = val;
  bool hasContrastingColor() => _contrastingColor != null;

  // "lightVibrant" field.
  Color? _lightVibrant;
  Color? get lightVibrant => _lightVibrant;
  set lightVibrant(Color? val) => _lightVibrant = val;
  bool hasLightVibrant() => _lightVibrant != null;

  // "darkVibrant" field.
  Color? _darkVibrant;
  Color? get darkVibrant => _darkVibrant;
  set darkVibrant(Color? val) => _darkVibrant = val;
  bool hasDarkVibrant() => _darkVibrant != null;

  static ColorPalettesStruct fromMap(Map<String, dynamic> data) =>
      ColorPalettesStruct(
        primaryColor: getSchemaColor(data['primaryColor']),
        contrastingColor: getSchemaColor(data['contrastingColor']),
        lightVibrant: getSchemaColor(data['lightVibrant']),
        darkVibrant: getSchemaColor(data['darkVibrant']),
      );

  static ColorPalettesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ColorPalettesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'primaryColor': _primaryColor,
        'contrastingColor': _contrastingColor,
        'lightVibrant': _lightVibrant,
        'darkVibrant': _darkVibrant,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primaryColor': serializeParam(
          _primaryColor,
          ParamType.Color,
        ),
        'contrastingColor': serializeParam(
          _contrastingColor,
          ParamType.Color,
        ),
        'lightVibrant': serializeParam(
          _lightVibrant,
          ParamType.Color,
        ),
        'darkVibrant': serializeParam(
          _darkVibrant,
          ParamType.Color,
        ),
      }.withoutNulls;

  static ColorPalettesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorPalettesStruct(
        primaryColor: deserializeParam(
          data['primaryColor'],
          ParamType.Color,
          false,
        ),
        contrastingColor: deserializeParam(
          data['contrastingColor'],
          ParamType.Color,
          false,
        ),
        lightVibrant: deserializeParam(
          data['lightVibrant'],
          ParamType.Color,
          false,
        ),
        darkVibrant: deserializeParam(
          data['darkVibrant'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'ColorPalettesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorPalettesStruct &&
        primaryColor == other.primaryColor &&
        contrastingColor == other.contrastingColor &&
        lightVibrant == other.lightVibrant &&
        darkVibrant == other.darkVibrant;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([primaryColor, contrastingColor, lightVibrant, darkVibrant]);
}

ColorPalettesStruct createColorPalettesStruct({
  Color? primaryColor,
  Color? contrastingColor,
  Color? lightVibrant,
  Color? darkVibrant,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ColorPalettesStruct(
      primaryColor: primaryColor,
      contrastingColor: contrastingColor,
      lightVibrant: lightVibrant,
      darkVibrant: darkVibrant,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ColorPalettesStruct? updateColorPalettesStruct(
  ColorPalettesStruct? colorPalettes, {
  bool clearUnsetFields = true,
}) =>
    colorPalettes
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addColorPalettesStructData(
  Map<String, dynamic> firestoreData,
  ColorPalettesStruct? colorPalettes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (colorPalettes == null) {
    return;
  }
  if (colorPalettes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && colorPalettes.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final colorPalettesData =
      getColorPalettesFirestoreData(colorPalettes, forFieldValue);
  final nestedData =
      colorPalettesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = colorPalettes.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getColorPalettesFirestoreData(
  ColorPalettesStruct? colorPalettes, [
  bool forFieldValue = false,
]) {
  if (colorPalettes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(colorPalettes.toMap());

  // Add any Firestore field values
  colorPalettes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getColorPalettesListFirestoreData(
  List<ColorPalettesStruct>? colorPalettess,
) =>
    colorPalettess
        ?.map((e) => getColorPalettesFirestoreData(e, true))
        .toList() ??
    [];
