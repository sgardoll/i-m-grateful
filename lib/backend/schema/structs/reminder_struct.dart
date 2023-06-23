// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReminderStruct extends FFFirebaseStruct {
  ReminderStruct({
    int? frequencyInDays,
    DateTime? startDateTime,
    DateTime? endDateTime,
    String? frequencyString,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _frequencyInDays = frequencyInDays,
        _startDateTime = startDateTime,
        _endDateTime = endDateTime,
        _frequencyString = frequencyString,
        super(firestoreUtilData);

  // "frequencyInDays" field.
  int? _frequencyInDays;
  int get frequencyInDays => _frequencyInDays ?? 0;
  set frequencyInDays(int? val) => _frequencyInDays = val;
  void incrementFrequencyInDays(int amount) =>
      _frequencyInDays = frequencyInDays + amount;
  bool hasFrequencyInDays() => _frequencyInDays != null;

  // "startDateTime" field.
  DateTime? _startDateTime;
  DateTime? get startDateTime => _startDateTime;
  set startDateTime(DateTime? val) => _startDateTime = val;
  bool hasStartDateTime() => _startDateTime != null;

  // "endDateTime" field.
  DateTime? _endDateTime;
  DateTime? get endDateTime => _endDateTime;
  set endDateTime(DateTime? val) => _endDateTime = val;
  bool hasEndDateTime() => _endDateTime != null;

  // "frequencyString" field.
  String? _frequencyString;
  String get frequencyString => _frequencyString ?? '';
  set frequencyString(String? val) => _frequencyString = val;
  bool hasFrequencyString() => _frequencyString != null;

  static ReminderStruct fromMap(Map<String, dynamic> data) => ReminderStruct(
        frequencyInDays: castToType<int>(data['frequencyInDays']),
        startDateTime: data['startDateTime'] as DateTime?,
        endDateTime: data['endDateTime'] as DateTime?,
        frequencyString: data['frequencyString'] as String?,
      );

  static ReminderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ReminderStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'frequencyInDays': _frequencyInDays,
        'startDateTime': _startDateTime,
        'endDateTime': _endDateTime,
        'frequencyString': _frequencyString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'frequencyInDays': serializeParam(
          _frequencyInDays,
          ParamType.int,
        ),
        'startDateTime': serializeParam(
          _startDateTime,
          ParamType.DateTime,
        ),
        'endDateTime': serializeParam(
          _endDateTime,
          ParamType.DateTime,
        ),
        'frequencyString': serializeParam(
          _frequencyString,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReminderStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReminderStruct(
        frequencyInDays: deserializeParam(
          data['frequencyInDays'],
          ParamType.int,
          false,
        ),
        startDateTime: deserializeParam(
          data['startDateTime'],
          ParamType.DateTime,
          false,
        ),
        endDateTime: deserializeParam(
          data['endDateTime'],
          ParamType.DateTime,
          false,
        ),
        frequencyString: deserializeParam(
          data['frequencyString'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReminderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReminderStruct &&
        frequencyInDays == other.frequencyInDays &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime &&
        frequencyString == other.frequencyString;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([frequencyInDays, startDateTime, endDateTime, frequencyString]);
}

ReminderStruct createReminderStruct({
  int? frequencyInDays,
  DateTime? startDateTime,
  DateTime? endDateTime,
  String? frequencyString,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReminderStruct(
      frequencyInDays: frequencyInDays,
      startDateTime: startDateTime,
      endDateTime: endDateTime,
      frequencyString: frequencyString,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReminderStruct? updateReminderStruct(
  ReminderStruct? reminder, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    reminder
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReminderStructData(
  Map<String, dynamic> firestoreData,
  ReminderStruct? reminder,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (reminder == null) {
    return;
  }
  if (reminder.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && reminder.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reminderData = getReminderFirestoreData(reminder, forFieldValue);
  final nestedData = reminderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = reminder.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReminderFirestoreData(
  ReminderStruct? reminder, [
  bool forFieldValue = false,
]) {
  if (reminder == null) {
    return {};
  }
  final firestoreData = mapToFirestore(reminder.toMap());

  // Add any Firestore field values
  reminder.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReminderListFirestoreData(
  List<ReminderStruct>? reminders,
) =>
    reminders?.map((e) => getReminderFirestoreData(e, true)).toList() ?? [];
