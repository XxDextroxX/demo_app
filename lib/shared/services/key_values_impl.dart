import 'package:demo_app/shared/services/key_values_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValuesImplementation extends KeyValueStorage {
  Future<SharedPreferences> getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPreference();
    switch (T) {
      case const (int):
        return prefs.getInt(key) as T?;
      case const (double):
        return prefs.getDouble(key) as T?;
      case const (String):
        return prefs.getString(key) as T?;
      case const (bool):
        return prefs.getBool(key) as T?;
      default:
        throw Exception('Get not supported type ${T.runtimeType} ');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPreference();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPreference();
    switch (T) {
      case const (int):
        prefs.setInt(key, value as int);
        break;
      case const (double):
        prefs.setDouble(key, value as double);
        break;
      case const (String):
        prefs.setString(key, value as String);
        break;
      case const (bool):
        prefs.setBool(key, value as bool);
        break;
      default:
        throw Exception('Not supported type ${T.runtimeType} ');
    }
  }
}
