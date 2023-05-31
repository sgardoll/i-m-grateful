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
    _bayhouseAPI =
        await secureStorage.getString('ff_bayhouseAPI') ?? _bayhouseAPI;
    _primary = _colorFromIntValue(await secureStorage.getInt('ff_primary')) ??
        _primary;
    _contrasting =
        _colorFromIntValue(await secureStorage.getInt('ff_contrasting')) ??
            _contrasting;
    _bodyTextColor =
        _colorFromIntValue(await secureStorage.getInt('ff_bodyTextColor')) ??
            _bodyTextColor;
    _StableApiKey =
        await secureStorage.getString('ff_StableApiKey') ?? _StableApiKey;
    _success = await secureStorage.getString('ff_success') ?? _success;
    _error = await secureStorage.getString('ff_error') ?? _error;
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
    secureStorage.setString('ff_primary', _value.value.toString());
  }

  void deletePrimary() {
    secureStorage.delete(key: 'ff_primary');
  }

  Color _contrasting = Color(4282412168);
  Color get contrasting => _contrasting;
  set contrasting(Color _value) {
    _contrasting = _value;
    secureStorage.setString('ff_contrasting', _value.value.toString());
  }

  void deleteContrasting() {
    secureStorage.delete(key: 'ff_contrasting');
  }

  Color _bodyTextColor = Color(4294967295);
  Color get bodyTextColor => _bodyTextColor;
  set bodyTextColor(Color _value) {
    _bodyTextColor = _value;
    secureStorage.setString('ff_bodyTextColor', _value.value.toString());
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

  final _stylesManager = FutureRequestManager<List<StylesRecord>>();
  Future<List<StylesRecord>> styles({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<StylesRecord>> Function() requestFn,
  }) =>
      _stylesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStylesCache() => _stylesManager.clear();
  void clearStylesCacheKey(String? uniqueKey) =>
      _stylesManager.clearRequest(uniqueKey);

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
