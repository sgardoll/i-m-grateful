import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _bayhouseAPI =
          await secureStorage.getString('ff_bayhouseAPI') ?? _bayhouseAPI;
    });
    await _safeInitAsync(() async {
      _primary = _colorFromIntValue(await secureStorage.getInt('ff_primary')) ??
          _primary;
    });
    await _safeInitAsync(() async {
      _contrasting =
          _colorFromIntValue(await secureStorage.getInt('ff_contrasting')) ??
              _contrasting;
    });
    await _safeInitAsync(() async {
      _bodyTextColor =
          _colorFromIntValue(await secureStorage.getInt('ff_bodyTextColor')) ??
              _bodyTextColor;
    });
    await _safeInitAsync(() async {
      _StableApiKey =
          await secureStorage.getString('ff_StableApiKey') ?? _StableApiKey;
    });
    await _safeInitAsync(() async {
      _success = await secureStorage.getString('ff_success') ?? _success;
    });
    await _safeInitAsync(() async {
      _error = await secureStorage.getString('ff_error') ?? _error;
    });
    await _safeInitAsync(() async {
      _replicateAPI =
          await secureStorage.getString('ff_replicateAPI') ?? _replicateAPI;
    });
    await _safeInitAsync(() async {
      _lightVibrant =
          _colorFromIntValue(await secureStorage.getInt('ff_lightVibrant')) ??
              _lightVibrant;
    });
    await _safeInitAsync(() async {
      _darkVibrant =
          _colorFromIntValue(await secureStorage.getInt('ff_darkVibrant')) ??
              _darkVibrant;
    });
    await _safeInitAsync(() async {
      _zeroLocation =
          _latLngFromString(await secureStorage.getString('ff_zeroLocation')) ??
              _zeroLocation;
    });
    await _safeInitAsync(() async {
      _showListView =
          await secureStorage.getBool('ff_showListView') ?? _showListView;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _btnTalk = '';
  String get btnTalk => _btnTalk;
  set btnTalk(String _value) {
    _btnTalk = _value;
  }

  String _stt = '';
  String get stt => _stt;
  set stt(String _value) {
    _stt = _value;
  }

  String _sstSendText = '';
  String get sstSendText => _sstSendText;
  set sstSendText(String _value) {
    _sstSendText = _value;
  }

  String _bayhouseAPI = 'hNpnRPkIGgRiImHBoiutfWmICsOkjFKxydNWWfvY';
  String get bayhouseAPI => _bayhouseAPI;
  set bayhouseAPI(String _value) {
    _bayhouseAPI = _value;
    secureStorage.setString('ff_bayhouseAPI', _value);
  }

  void deleteBayhouseAPI() {
    secureStorage.delete(key: 'ff_bayhouseAPI');
  }

  Color _primary = Color(4294752105);
  Color get primary => _primary;
  set primary(Color _value) {
    _primary = _value;
    secureStorage.setInt('ff_primary', _value.value);
  }

  void deletePrimary() {
    secureStorage.delete(key: 'ff_primary');
  }

  Color _contrasting = Color(4282412168);
  Color get contrasting => _contrasting;
  set contrasting(Color _value) {
    _contrasting = _value;
    secureStorage.setInt('ff_contrasting', _value.value);
  }

  void deleteContrasting() {
    secureStorage.delete(key: 'ff_contrasting');
  }

  Color _bodyTextColor = Color(4294967295);
  Color get bodyTextColor => _bodyTextColor;
  set bodyTextColor(Color _value) {
    _bodyTextColor = _value;
    secureStorage.setInt('ff_bodyTextColor', _value.value);
  }

  void deleteBodyTextColor() {
    secureStorage.delete(key: 'ff_bodyTextColor');
  }

  String _StableApiKey = 'sk-kLf2l8Gy4Ona8ztn7RJIIEeYpW81Riuyr9q8KebPAoqPXleo';
  String get StableApiKey => _StableApiKey;
  set StableApiKey(String _value) {
    _StableApiKey = _value;
    secureStorage.setString('ff_StableApiKey', _value);
  }

  void deleteStableApiKey() {
    secureStorage.delete(key: 'ff_StableApiKey');
  }

  String _success = 'Success';
  String get success => _success;
  set success(String _value) {
    _success = _value;
    secureStorage.setString('ff_success', _value);
  }

  void deleteSuccess() {
    secureStorage.delete(key: 'ff_success');
  }

  String _error = 'Error';
  String get error => _error;
  set error(String _value) {
    _error = _value;
    secureStorage.setString('ff_error', _value);
  }

  void deleteError() {
    secureStorage.delete(key: 'ff_error');
  }

  String _replicateAPI = '905598db1e31366d29b82a8a423d50b6d53d3cf4';
  String get replicateAPI => _replicateAPI;
  set replicateAPI(String _value) {
    _replicateAPI = _value;
    secureStorage.setString('ff_replicateAPI', _value);
  }

  void deleteReplicateAPI() {
    secureStorage.delete(key: 'ff_replicateAPI');
  }

  List<String> _foregroundImages = [
    'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/rio.png',
    'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/france.png',
    'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/iceland.png'
  ];
  List<String> get foregroundImages => _foregroundImages;
  set foregroundImages(List<String> _value) {
    _foregroundImages = _value;
  }

  void addToForegroundImages(String _value) {
    _foregroundImages.add(_value);
  }

  void removeFromForegroundImages(String _value) {
    _foregroundImages.remove(_value);
  }

  void removeAtIndexFromForegroundImages(int _index) {
    _foregroundImages.removeAt(_index);
  }

  void updateForegroundImagesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _foregroundImages[_index] = updateFn(_foregroundImages[_index]);
  }

  List<String> _backgroundImages = [
    'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/rio-bg.jpg',
    'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/france-bg.jpg',
    'https://raw.githubusercontent.com/sbis04/flutter-parallax-cards/main/images/iceland-bg.jpg'
  ];
  List<String> get backgroundImages => _backgroundImages;
  set backgroundImages(List<String> _value) {
    _backgroundImages = _value;
  }

  void addToBackgroundImages(String _value) {
    _backgroundImages.add(_value);
  }

  void removeFromBackgroundImages(String _value) {
    _backgroundImages.remove(_value);
  }

  void removeAtIndexFromBackgroundImages(int _index) {
    _backgroundImages.removeAt(_index);
  }

  void updateBackgroundImagesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _backgroundImages[_index] = updateFn(_backgroundImages[_index]);
  }

  List<String> _texts = ['Brazil', 'France', 'Iceland'];
  List<String> get texts => _texts;
  set texts(List<String> _value) {
    _texts = _value;
  }

  void addToTexts(String _value) {
    _texts.add(_value);
  }

  void removeFromTexts(String _value) {
    _texts.remove(_value);
  }

  void removeAtIndexFromTexts(int _index) {
    _texts.removeAt(_index);
  }

  void updateTextsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _texts[_index] = updateFn(_texts[_index]);
  }

  Color _lightVibrant = Color(4283782485);
  Color get lightVibrant => _lightVibrant;
  set lightVibrant(Color _value) {
    _lightVibrant = _value;
    secureStorage.setInt('ff_lightVibrant', _value.value);
  }

  void deleteLightVibrant() {
    secureStorage.delete(key: 'ff_lightVibrant');
  }

  Color _darkVibrant = Color(4281545523);
  Color get darkVibrant => _darkVibrant;
  set darkVibrant(Color _value) {
    _darkVibrant = _value;
    secureStorage.setInt('ff_darkVibrant', _value.value);
  }

  void deleteDarkVibrant() {
    secureStorage.delete(key: 'ff_darkVibrant');
  }

  LatLng? _zeroLocation = LatLng(0.0, 0.0);
  LatLng? get zeroLocation => _zeroLocation;
  set zeroLocation(LatLng? _value) {
    _zeroLocation = _value;
    _value != null
        ? secureStorage.setString('ff_zeroLocation', _value.serialize())
        : secureStorage.remove('ff_zeroLocation');
  }

  void deleteZeroLocation() {
    secureStorage.delete(key: 'ff_zeroLocation');
  }

  bool _showListView = true;
  bool get showListView => _showListView;
  set showListView(bool _value) {
    _showListView = _value;
    secureStorage.setBool('ff_showListView', _value);
  }

  void deleteShowListView() {
    secureStorage.delete(key: 'ff_showListView');
  }

  final _itemsManager = StreamRequestManager<List<ItemRecord>>();
  Stream<List<ItemRecord>> items({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ItemRecord>> Function() requestFn,
  }) =>
      _itemsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearItemsCache() => _itemsManager.clear();
  void clearItemsCacheKey(String? uniqueKey) =>
      _itemsManager.clearRequest(uniqueKey);

  final _stylePrefManager = StreamRequestManager<List<StylesRecord>>();
  Stream<List<StylesRecord>> stylePref({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<StylesRecord>> Function() requestFn,
  }) =>
      _stylePrefManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStylePrefCache() => _stylePrefManager.clear();
  void clearStylePrefCacheKey(String? uniqueKey) =>
      _stylePrefManager.clearRequest(uniqueKey);

  final _insightsQueryManager = StreamRequestManager<List<InsightsRecord>>();
  Stream<List<InsightsRecord>> insightsQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<InsightsRecord>> Function() requestFn,
  }) =>
      _insightsQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearInsightsQueryCache() => _insightsQueryManager.clear();
  void clearInsightsQueryCacheKey(String? uniqueKey) =>
      _insightsQueryManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
