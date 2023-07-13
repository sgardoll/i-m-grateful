import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsightsRecord extends FirestoreRecord {
  InsightsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "entries" field.
  List<DocumentReference>? _entries;
  List<DocumentReference> get entries => _entries ?? const [];
  bool hasEntries() => _entries != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "timesInsight" field.
  String? _timesInsight;
  String get timesInsight => _timesInsight ?? '';
  bool hasTimesInsight() => _timesInsight != null;

  // "styleInsight" field.
  String? _styleInsight;
  String get styleInsight => _styleInsight ?? '';
  bool hasStyleInsight() => _styleInsight != null;

  // "themesInsight" field.
  String? _themesInsight;
  String get themesInsight => _themesInsight ?? '';
  bool hasThemesInsight() => _themesInsight != null;

  // "locationInsight" field.
  String? _locationInsight;
  String get locationInsight => _locationInsight ?? '';
  bool hasLocationInsight() => _locationInsight != null;

  // "locations" field.
  List<String>? _locations;
  List<String> get locations => _locations ?? const [];
  bool hasLocations() => _locations != null;

  // "locationInsightMajority" field.
  MainLocationStruct? _locationInsightMajority;
  MainLocationStruct get locationInsightMajority =>
      _locationInsightMajority ?? MainLocationStruct();
  bool hasLocationInsightMajority() => _locationInsightMajority != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _entries = getDataList(snapshotData['entries']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _timesInsight = snapshotData['timesInsight'] as String?;
    _styleInsight = snapshotData['styleInsight'] as String?;
    _themesInsight = snapshotData['themesInsight'] as String?;
    _locationInsight = snapshotData['locationInsight'] as String?;
    _locations = getDataList(snapshotData['locations']);
    _locationInsightMajority = MainLocationStruct.maybeFromMap(
        snapshotData['locationInsightMajority']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('insights');

  static Stream<InsightsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsightsRecord.fromSnapshot(s));

  static Future<InsightsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InsightsRecord.fromSnapshot(s));

  static InsightsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsightsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsightsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsightsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsightsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsightsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsightsRecordData({
  DocumentReference? userRef,
  DateTime? timestamp,
  String? timesInsight,
  String? styleInsight,
  String? themesInsight,
  String? locationInsight,
  MainLocationStruct? locationInsightMajority,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'timestamp': timestamp,
      'timesInsight': timesInsight,
      'styleInsight': styleInsight,
      'themesInsight': themesInsight,
      'locationInsight': locationInsight,
      'locationInsightMajority': MainLocationStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "locationInsightMajority" field.
  addMainLocationStructData(
      firestoreData, locationInsightMajority, 'locationInsightMajority');

  return firestoreData;
}

class InsightsRecordDocumentEquality implements Equality<InsightsRecord> {
  const InsightsRecordDocumentEquality();

  @override
  bool equals(InsightsRecord? e1, InsightsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.entries, e2?.entries) &&
        e1?.timestamp == e2?.timestamp &&
        e1?.timesInsight == e2?.timesInsight &&
        e1?.styleInsight == e2?.styleInsight &&
        e1?.themesInsight == e2?.themesInsight &&
        e1?.locationInsight == e2?.locationInsight &&
        listEquality.equals(e1?.locations, e2?.locations) &&
        e1?.locationInsightMajority == e2?.locationInsightMajority;
  }

  @override
  int hash(InsightsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.entries,
        e?.timestamp,
        e?.timesInsight,
        e?.styleInsight,
        e?.themesInsight,
        e?.locationInsight,
        e?.locations,
        e?.locationInsightMajority
      ]);

  @override
  bool isValidKey(Object? o) => o is InsightsRecord;
}
