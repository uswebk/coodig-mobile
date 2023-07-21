import 'dart:convert';

import 'package:coodig_mobile/service/otp_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../mock.mocks.dart';

void main() {
  test('Otp information can be obtained when data is successfully retrieved from the access token.', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockOtpRepository = MockOtpRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    final response = http.Response(jsonEncode({'code': '555555', 'expiration_at': '2023-01-01 10:10:10'}), 200);
    when(mockOtpRepository.fetch('XXX')).thenAnswer((_) async => Future.value(response));

    final sut = OtpService(mockAuthService, mockSecureStorageService, mockOtpRepository);
    final result = await sut.fetch();

    verifyNever(mockAuthService.refresh());
    expect(result?.code, '555555');
  });

  test('Once an authentication error occurs, a refresh token is used', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockOtpRepository = MockOtpRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    final response = http.Response(jsonEncode({'': ''}), 401);
    when(mockOtpRepository.fetch('XXX')).thenAnswer((_) async => Future.value(response));

    final sut = OtpService(mockAuthService, mockSecureStorageService, mockOtpRepository);
    await sut.fetch();

    verify(mockAuthService.refresh());
  });

  test('Otp information can be obtained if the access token is successfully obtained using a refresh token', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockOtpRepository = MockOtpRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    int callCount = 0;
    final response = http.Response(jsonEncode({'': ''}), 401);
    final responseSecondTime =
        http.Response(jsonEncode({'code': '555555', 'expiration_at': '2023-01-01 10:10:10'}), 200);
    when(mockOtpRepository.fetch('XXX')).thenAnswer((_) async {
      if (callCount == 0) {
        callCount++;
        return Future.value(response);
      }

      return Future.value(responseSecondTime);
    });

    final sut = OtpService(mockAuthService, mockSecureStorageService, mockOtpRepository);
    final result = await sut.fetch();

    verify(mockAuthService.refresh());
    expect(result?.code, '555555');
  });

  test('Otp information cannot be retrieved if access token acquisition fails using a refresh token', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockOtpRepository = MockOtpRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    int callCount = 0;
    final response = http.Response(jsonEncode({'': ''}), 401);
    final responseSecondTime = http.Response(jsonEncode({'': ''}), 401);
    when(mockOtpRepository.fetch('XXX')).thenAnswer((_) async {
      if (callCount == 0) {
        callCount++;
        return Future.value(response);
      }

      return Future.value(responseSecondTime);
    });

    final sut = OtpService(mockAuthService, mockSecureStorageService, mockOtpRepository);
    final result = await sut.fetch();

    verify(mockAuthService.refresh());
    expect(result, null);
  });
}
