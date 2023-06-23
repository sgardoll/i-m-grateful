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
    List<ReminderStruct>? reminders,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _locationEnabledByDefault = locationEnabledByDefault,
        _isFirstLoad = isFirstLoad,
        _reminders = reminders,
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

  // "reminders" field.
  List<ReminderStruct>? _reminders;
  List<ReminderStruct> get reminders => _reminders ?? const [];
  set reminders(List<ReminderStruct>? val) => _reminders = val;
  void updateReminders(Function(List<ReminderStruct>) updateFn) =>
      updateFn(_reminders ??= []);
  bool hasReminders() => _reminders != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        locationEnabledByDefault: data['locationEnabledByDefault'] as bool?,
        isFirstLoad: data['isFirstLoad'] as bool?,
        reminders: getStructList(
          data['reminders'],
          ReminderStruct.fromMap,
        ),
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SettingsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'locationEnabledByDefault': _locationEnabledByDefault,
        'isFirstLoad': _isFirstLoad,
        'reminders': _reminders?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'locationEnabledByDefault': serializeParam(
          _locationEnabledByDefault,
          ParamType.bool,
        ),
        'isFirstLoad': serializeParam(
          _isFirstLoad,
          ParamType.bool,
        ),
        'reminders': serializeParam(
          _reminders,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsStruct(
        locationEnabledByDefault: deserializeParam(
          data['locationEnabledByDefault'],
          ParamType.bool,
          false,
        ),
        isFirstLoad: deserializeParam(
          data['isFirstLoad'],
          ParamType.bool,
          false,
        ),
        reminders: deserializeStructParam<ReminderStruct>(
          data['reminders'],
          ParamType.DataStruct,
          true,
          structBuilder: ReminderStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SettingsStruct &&
        locationEnabledByDefault == other.locationEnabledByDefault &&
        isFirstLoad == other.isFirstLoad &&
        listEquality.equals(reminders, other.reminders);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([locationEnabledByDefault, isFirstLoad, reminders]);
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
  bool create = false,
}) =>
    settings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

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
