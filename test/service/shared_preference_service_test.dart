import 'package:coodig_mobile/service/shared_preference_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock.mocks.dart';

void main() {
  test('Returns true on initial startup', () async {
    final mock = MockSharedPreferencesRepository();
    when(mock.readBool('isFirstTime')).thenAnswer((_) => null);

    final sut = SharedPreferenceService(mock);
    final result = sut.isFirstTime();
    expect(result, true);
  });

  test('Returns true on initial startup and has local flag', () async {
    final mock = MockSharedPreferencesRepository();
    when(mock.readBool('isFirstTime')).thenAnswer((_) => true);

    final sut = SharedPreferenceService(mock);
    final result = sut.isFirstTime();
    expect(result, true);
  });

  test('Returns false on not initial startup', () async {
    final mock = MockSharedPreferencesRepository();
    when(mock.readBool('isFirstTime')).thenAnswer((_) => false);

    final sut = SharedPreferenceService(mock);
    final result = sut.isFirstTime();
    expect(result, false);
  });
}
