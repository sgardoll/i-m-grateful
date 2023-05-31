// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsStruct extends FFFirebaseStruct {
  SettingsStruct({
    bool? locationEnabledByDefault,
    bool? isFirstLoad,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _locationEnabledByDefault = locationEnabledByDefault,
        _isFirstLoad = isFirstLoad,
        super(firestoreUtilData);

  // "locationEnabledByDefault" field.
  bool? _locationEnabledByDefault;
  bool get locationEnabledByDefault => _locationEnabledByDefault ?? false;
  set locationEnabledByDefault(bool? val) => _locationEnabledByDefault = val;
  bool hasLocationEnabledByDefault() => _locationEnabledByDefault != null;

  // "isFirstLoad" field.
  bool? _isFirstLoad;
  bool get isFirstLoad => _isFirstLoad ?? false;
  set isFirstLoad(bool? val) => _isFirstLoad = val;
  bool hasIsFirstLoad() => _isFirstLoad != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        locationEnabledByDefault: data['locationEnabledByDefault'] as bool?,
        isFirstLoad: data['isFirstLoad'] as bool?,
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SettingsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'locationEnabledByDefault': _locationEnabledByDefault,
        'isFirstLoad': _isFirstLoad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'SettingsStruct(${toMap()})';
}

SettingsStruct createSettingsStruct({
  bool? locationEnabledByDefault,
  bool? isFirstLoad,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsStruct(
      locationEnabledByDefault: locationEnabledByDefault,
      isFirstLoad: isFirstLoad,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsStruct? updateSettingsStruct(
  SettingsStruct? settings, {
  bool clearUnsetFields = true,
}) =>
    settings
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addSettingsStructData(
  Map<String, dynamic> firestoreData,
  SettingsStruct? settings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settings == null) {
    return;
  }
  if (settings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && settings.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsData = getSettingsFirestoreData(settings, forFieldValue);
  final nestedData = settingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = settings.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsFirestoreData(
  SettingsStruct? settings, [
  bool forFieldValue = false,
]) {
  if (settings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settings.toMap());

  // Add any Firestore field values
  settings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsListFirestoreData(
  List<SettingsStruct>? settingss,
) =>
    settingss?.map((e) => getSettingsFirestoreData(e, true)).toList() ?? [];
