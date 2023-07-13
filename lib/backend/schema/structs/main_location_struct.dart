// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MainLocationStruct extends FFFirebaseStruct {
  MainLocationStruct({
    double? latitude,
    double? longitude,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _latitude = latitude,
        _longitude = longitude,
        super(firestoreUtilData);

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  static MainLocationStruct fromMap(Map<String, dynamic> data) =>
      MainLocationStruct(
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
      );

  static MainLocationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MainLocationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static MainLocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      MainLocationStruct(
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MainLocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MainLocationStruct &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([latitude, longitude]);
}

MainLocationStruct createMainLocationStruct({
  double? latitude,
  double? longitude,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MainLocationStruct(
      latitude: latitude,
      longitude: longitude,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MainLocationStruct? updateMainLocationStruct(
  MainLocationStruct? mainLocation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mainLocation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMainLocationStructData(
  Map<String, dynamic> firestoreData,
  MainLocationStruct? mainLocation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mainLocation == null) {
    return;
  }
  if (mainLocation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && mainLocation.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mainLocationData =
      getMainLocationFirestoreData(mainLocation, forFieldValue);
  final nestedData =
      mainLocationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = mainLocation.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMainLocationFirestoreData(
  MainLocationStruct? mainLocation, [
  bool forFieldValue = false,
]) {
  if (mainLocation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mainLocation.toMap());

  // Add any Firestore field values
  mainLocation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMainLocationListFirestoreData(
  List<MainLocationStruct>? mainLocations,
) =>
    mainLocations?.map((e) => getMainLocationFirestoreData(e, true)).toList() ??
    [];
