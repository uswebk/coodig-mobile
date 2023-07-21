import 'dart:convert';

import 'package:coodig_mobile/service/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../mock.mocks.dart';

void main() {
  test('User information can be obtained when data is successfully retrieved from the access token.', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockUserRepository = MockUserRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    final response = http.Response(jsonEncode({'name': 'fake_name', 'email': 'fake@example.com'}), 200);
    when(mockUserRepository.fetchMe('XXX')).thenAnswer((_) async => Future.value(response));

    final sut = UserService(mockAuthService, mockSecureStorageService, mockUserRepository);
    final result = await sut.fetchMe();

    verifyNever(mockAuthService.refresh());
    expect(result?.name, 'fake_name');
    expect(result?.email, 'fake@example.com');
  });

  test('Once an authentication error occurs, a refresh token is used', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockUserRepository = MockUserRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    final response = http.Response(jsonEncode({'': ''}), 401);
    when(mockUserRepository.fetchMe('XXX')).thenAnswer((_) async => Future.value(response));

    final sut = UserService(mockAuthService, mockSecureStorageService, mockUserRepository);
    await sut.fetchMe();

    verify(mockAuthService.refresh());
  });

  test('User information can be obtained if the access token is successfully obtained using a refresh token', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockUserRepository = MockUserRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    int callCount = 0;
    final response = http.Response(jsonEncode({'': ''}), 401);
    final responseSecondTime = http.Response(jsonEncode({'name': 'fake_name', 'email': 'fake@example.com'}), 200);
    when(mockUserRepository.fetchMe('XXX')).thenAnswer((_) async {
      if (callCount == 0) {
        callCount++;
        return Future.value(response);
      }

      return Future.value(responseSecondTime);
    });

    final sut = UserService(mockAuthService, mockSecureStorageService, mockUserRepository);
    final result = await sut.fetchMe();

    verify(mockAuthService.refresh());
    expect(result?.name, 'fake_name');
    expect(result?.email, 'fake@example.com');
  });

  test('User information cannot be retrieved if access token acquisition fails using a refresh token', () async {
    final mockAuthService = MockAuthService();
    final mockSecureStorageService = MockSecureStorageService();
    final mockUserRepository = MockUserRepository();

    when(mockSecureStorageService.getAccessToken()).thenAnswer((_) async => Future.value('XXX'));
    int callCount = 0;
    final response = http.Response(jsonEncode({'': ''}), 401);
    final responseSecondTime = http.Response(jsonEncode({'': ''}), 401);
    when(mockUserRepository.fetchMe('XXX')).thenAnswer((_) async {
      if (callCount == 0) {
        callCount++;
        return Future.value(response);
      }

      return Future.value(responseSecondTime);
    });

    final sut = UserService(mockAuthService, mockSecureStorageService, mockUserRepository);
    final result = await sut.fetchMe();

    verify(mockAuthService.refresh());
    expect(result, null);
  });
}
