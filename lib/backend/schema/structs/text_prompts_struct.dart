// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TextPromptsStruct extends FFFirebaseStruct {
  TextPromptsStruct({
    String? text,
    double? weight,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _weight = weight,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;
  void incrementWeight(double amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  static TextPromptsStruct fromMap(Map<String, dynamic> data) =>
      TextPromptsStruct(
        text: data['text'] as String?,
        weight: castToType<double>(data['weight']),
      );

  static TextPromptsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TextPromptsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'weight': _weight,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
      }.withoutNulls;

  static TextPromptsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TextPromptsStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TextPromptsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TextPromptsStruct &&
        text == other.text &&
        weight == other.weight;
  }

  @override
  int get hashCode => const ListEquality().hash([text, weight]);
}

TextPromptsStruct createTextPromptsStruct({
  String? text,
  double? weight,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TextPromptsStruct(
      text: text,
      weight: weight,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TextPromptsStruct? updateTextPromptsStruct(
  TextPromptsStruct? textPrompts, {
  bool clearUnsetFields = true,
}) =>
    textPrompts
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addTextPromptsStructData(
  Map<String, dynamic> firestoreData,
  TextPromptsStruct? textPrompts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (textPrompts == null) {
    return;
  }
  if (textPrompts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && textPrompts.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final textPromptsData =
      getTextPromptsFirestoreData(textPrompts, forFieldValue);
  final nestedData =
      textPromptsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = textPrompts.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTextPromptsFirestoreData(
  TextPromptsStruct? textPrompts, [
  bool forFieldValue = false,
]) {
  if (textPrompts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(textPrompts.toMap());

  // Add any Firestore field values
  textPrompts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTextPromptsListFirestoreData(
  List<TextPromptsStruct>? textPromptss,
) =>
    textPromptss?.map((e) => getTextPromptsFirestoreData(e, true)).toList() ??
    [];
