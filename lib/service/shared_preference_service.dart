import 'package:coodig_mobile/repository/shared_preferences_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sharedPreferenceServiceProvider = Provider<Future<SharedPreferenceService>>(
    (ref) async => SharedPreferenceService(await ref.watch(sharedPreferencesRepositoryProvider)));

class SharedPreferenceService {
  SharedPreferenceService(this._sharedPreferencesRepository);

  final SharedPreferencesRepository _sharedPreferencesRepository;
  final String _isFirstTImeKey = 'isFirstTime';

  Future<void> setIsFirstTime(bool isFirstTime) async {
    await _sharedPreferencesRepository.writeBool(_isFirstTImeKey, isFirstTime);
  }

  bool isFirstTime() {
    bool? isFirstTime = _sharedPreferencesRepository.readBool(_isFirstTImeKey);

    if (isFirstTime == null) {
      return true;
    }

    return isFirstTime;
  }
}
