import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/service/splash_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock.mocks.dart';

void main() {
  test('If authenticated, the dashboard widget is returned', () async {
    final mock = MockDeeplinkService();
    when(mock.getLink()).thenAnswer((_) async => Future.value(null));

    final sut = SplashService(mock);
    final result = await sut.getScreen(UserStatus.authenticated);
    expect(result, isA<DashboardPage>());
  });

  test('If account registered with unauthorized, the otp widget is returned', () async {
    final mock = MockDeeplinkService();
    when(mock.getLink()).thenAnswer((_) async => Future.value(null));

    final sut = SplashService(mock);
    final result = await sut.getScreen(UserStatus.emailNotVerified);
    expect(result, isA<OtpPage>());
  });

  test('If account not registered, the launch widget is returned', () async {
    final mock = MockDeeplinkService();
    when(mock.getLink()).thenAnswer((_) async => Future.value(null));

    final sut = SplashService(mock);
    final result = await sut.getScreen(UserStatus.unauthenticated);
    expect(result, isA<LaunchPage>());
  });

  test('the screen transitions are based on that link, when you have a deep link', () async {
    final mock = MockDeeplinkService();
    when(mock.getLink()).thenAnswer((_) async => Future.value('example://reset-password/'));

    final sut = SplashService(mock);
    await sut.getScreen(UserStatus.unauthenticated);
    verify(mock.getScreen('example://reset-password/')).called(1);
  });
}
