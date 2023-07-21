import 'package:coodig_mobile/feature/password_reset/password_reset_page.dart';
import 'package:coodig_mobile/feature/splash/splash_screen.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock.mocks.dart';

void main() {
  test('get password reset screen by link when reset-password', () async {
    final sut = DeeplinkService(MockEnvironmentService(), MockDateTimeCore());
    final result = sut.getScreen('coodig://reset-password/dummy');
    expect(result, isA<PasswordResetPage>());
  });

  test('get splash screen by link when not match host', () async {
    final sut = DeeplinkService(MockEnvironmentService(), MockDateTimeCore());
    final result = sut.getScreen('coodig://foo.com/dummy');
    expect(result, isA<SplashScreen>());
  });

  test('verify if the signature is correct within the validity period', () async {
    final mockEnvironmentService = MockEnvironmentService();
    final mockDateTimeCore = MockDateTimeCore();

    when(mockDateTimeCore.now()).thenAnswer((_) => DateTime(2023, 01, 01, 12, 0, 0));
    when(mockEnvironmentService.getUriSecretKey()).thenAnswer((_) => 'XXX');

    final sut = DeeplinkService(mockEnvironmentService, mockDateTimeCore);

    // date: 2023-07-09 01:46:40
    // Secret: XXX
    final result = sut.verifySignedUri(
        'dev.coodig://reset-password/MTE2/br1r54-c95c8715ca9d02c5b951444c5331518b:1688834800.067979:8f7aafd607d5ab2a0d80243c1c6a90a7048455f90e929d9722bbc107afec2aeb');
    expect(result, true);
  });

  test('invalidate if the signature is not correct', () async {
    final mockEnvironmentService = MockEnvironmentService();
    final mockDateTimeCore = MockDateTimeCore();

    when(mockDateTimeCore.now()).thenAnswer((_) => DateTime(2023, 01, 01, 12, 0, 0));
    when(mockEnvironmentService.getUriSecretKey()).thenAnswer((_) => 'XXX');

    final sut = DeeplinkService(mockEnvironmentService, mockDateTimeCore);

    // date: 2023-07-09 01:46:40
    // Secret: XXX
    final result = sut.verifySignedUri(
        'dev.coodig://reset-password/foo/br1r54-c95c8715ca9d02c5b951444c5331518b:1688834800.067979:8f7aafd607d5ab2a0d80243c1c6a90a7048455f90e929d9722bbc107afec2aeb');
    expect(result, false);
  });

  test('invalidate if expiration of validity', () async {
    final mockEnvironmentService = MockEnvironmentService();
    final mockDateTimeCore = MockDateTimeCore();

    when(mockDateTimeCore.now()).thenAnswer((_) => DateTime(2024, 01, 01, 12, 0, 0));
    when(mockEnvironmentService.getUriSecretKey()).thenAnswer((_) => 'XXX');

    final sut = DeeplinkService(mockEnvironmentService, mockDateTimeCore);

    // date: 2023-07-09 01:46:40
    // Secret: XXX
    final result = sut.verifySignedUri(
        'dev.coodig://reset-password/foo/br1r54-c95c8715ca9d02c5b951444c5331518b:1688834800.067979:8f7aafd607d5ab2a0d80243c1c6a90a7048455f90e929d9722bbc107afec2aeb');
    expect(result, false);
  });
}
