import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesRepositoryProvider =
    Provider((ref) async => SharedPreferencesRepository(await SharedPreferences.getInstance()));

class SharedPreferencesRepository {
  final SharedPreferences _prefs;

  SharedPreferencesRepository(this._prefs);

  Future<void> writeBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  bool? readBool(String key) {
    return _prefs.getBool(key);
  }
}
