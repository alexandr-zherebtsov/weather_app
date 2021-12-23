import 'package:hive/hive.dart';

class Preferences {
  static const String _preferencesBox = '_preferencesBox';
  static const String _prefCurrentLocation = '_prefCurrentLocation';
  static const String _prefLastWeather = '_prefLastWeather';

  Box<dynamic>? _box;

  Future<void> openBox() async => _box = await Hive.openBox<dynamic>(_preferencesBox);

  Future<void> setCurrentLocation(Map<String, dynamic>? e) async => await _setValue(_prefCurrentLocation, e);
  Future<Map<String, dynamic>?> getCurrentLocation() async => await _getValue(_prefCurrentLocation);

  Future<void> setLastWeather(Map<String, dynamic>? e) async => await _setValue(_prefLastWeather, e);
  Future<Map<String, dynamic>?> getLastWeather() async => await _getValue(_prefLastWeather);

  Future<T> _getValue<T>(dynamic key, {T? defaultValue}) async => await _box!.get(key, defaultValue: defaultValue) as T;

  Future<void> _setValue<T>(dynamic key, T value) async => await _box!.put(key, value);

  Future<void> clearCache() async => await _box!.clear();
}
