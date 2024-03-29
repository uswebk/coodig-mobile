// Mocks generated by Mockito 5.4.0 from annotations
// in coodig_mobile/test/mock.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:coodig_mobile/core/datetime.dart' as _i4;
import 'package:coodig_mobile/core/environment.dart' as _i5;
import 'package:coodig_mobile/enum/user_status.dart' as _i9;
import 'package:coodig_mobile/model/token.dart' as _i13;
import 'package:coodig_mobile/repository/otp_repository.dart' as _i15;
import 'package:coodig_mobile/repository/shared_preferences_repository.dart'
    as _i16;
import 'package:coodig_mobile/repository/user_repository.dart' as _i14;
import 'package:coodig_mobile/service/auth_service.dart' as _i11;
import 'package:coodig_mobile/service/deeplink_service.dart' as _i7;
import 'package:coodig_mobile/service/environment_service.dart' as _i10;
import 'package:coodig_mobile/service/secure_storage_service.dart' as _i12;
import 'package:coodig_mobile/service/splash_service.dart' as _i8;
import 'package:flutter/material.dart' as _i2;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDateTime_0 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_1 extends _i1.SmartFake implements _i2.Widget {
  _FakeWidget_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i2.DiagnosticLevel? minLevel = _i2.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeResponse_2 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DateTimeCore].
///
/// See the documentation for Mockito's code generation for more information.
class MockDateTimeCore extends _i1.Mock implements _i4.DateTimeCore {
  @override
  DateTime now() => (super.noSuchMethod(
        Invocation.method(
          #now,
          [],
        ),
        returnValue: _FakeDateTime_0(
          this,
          Invocation.method(
            #now,
            [],
          ),
        ),
        returnValueForMissingStub: _FakeDateTime_0(
          this,
          Invocation.method(
            #now,
            [],
          ),
        ),
      ) as DateTime);
}

/// A class which mocks [Environment].
///
/// See the documentation for Mockito's code generation for more information.
class MockEnvironment extends _i1.Mock implements _i5.Environment {
  @override
  String getEndpoint() => (super.noSuchMethod(
        Invocation.method(
          #getEndpoint,
          [],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String getUriSecretKey() => (super.noSuchMethod(
        Invocation.method(
          #getUriSecretKey,
          [],
        ),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  bool isProduction() => (super.noSuchMethod(
        Invocation.method(
          #isProduction,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i6.Future<String> getVersion() => (super.noSuchMethod(
        Invocation.method(
          #getVersion,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
        returnValueForMissingStub: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
}

/// A class which mocks [DeeplinkService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeeplinkService extends _i1.Mock implements _i7.DeeplinkService {
  @override
  _i6.Future<String?> getLink() => (super.noSuchMethod(
        Invocation.method(
          #getLink,
          [],
        ),
        returnValue: _i6.Future<String?>.value(),
        returnValueForMissingStub: _i6.Future<String?>.value(),
      ) as _i6.Future<String?>);
  @override
  void initDeeplink() => super.noSuchMethod(
        Invocation.method(
          #initDeeplink,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Widget getScreen(String? link) => (super.noSuchMethod(
        Invocation.method(
          #getScreen,
          [link],
        ),
        returnValue: _FakeWidget_1(
          this,
          Invocation.method(
            #getScreen,
            [link],
          ),
        ),
        returnValueForMissingStub: _FakeWidget_1(
          this,
          Invocation.method(
            #getScreen,
            [link],
          ),
        ),
      ) as _i2.Widget);
  @override
  bool verifySignedUri(String? uri) => (super.noSuchMethod(
        Invocation.method(
          #verifySignedUri,
          [uri],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
}

/// A class which mocks [SplashService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSplashService extends _i1.Mock implements _i8.SplashService {
  @override
  _i6.Future<_i2.Widget> getScreen(_i9.UserStatus? userStatus) =>
      (super.noSuchMethod(
        Invocation.method(
          #getScreen,
          [userStatus],
        ),
        returnValue: _i6.Future<_i2.Widget>.value(_FakeWidget_1(
          this,
          Invocation.method(
            #getScreen,
            [userStatus],
          ),
        )),
        returnValueForMissingStub: _i6.Future<_i2.Widget>.value(_FakeWidget_1(
          this,
          Invocation.method(
            #getScreen,
            [userStatus],
          ),
        )),
      ) as _i6.Future<_i2.Widget>);
}

/// A class which mocks [EnvironmentService].
///
/// See the documentation for Mockito's code generation for more information.
class MockEnvironmentService extends _i1.Mock
    implements _i10.EnvironmentService {}

/// A class which mocks [AuthService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthService extends _i1.Mock implements _i11.AuthService {
  @override
  _i6.Future<void> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> signup(
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [
            name,
            email,
            password,
            confirmPassword,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> refresh() => (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> loginByBiometrics() => (super.noSuchMethod(
        Invocation.method(
          #loginByBiometrics,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<bool> verify(String? otp) => (super.noSuchMethod(
        Invocation.method(
          #verify,
          [otp],
        ),
        returnValue: _i6.Future<bool>.value(false),
        returnValueForMissingStub: _i6.Future<bool>.value(false),
      ) as _i6.Future<bool>);
  @override
  _i6.Future<void> resendOtp() => (super.noSuchMethod(
        Invocation.method(
          #resendOtp,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> sendResetPassword(String? email) => (super.noSuchMethod(
        Invocation.method(
          #sendResetPassword,
          [email],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> resetPassword(
    String? uid,
    String? token,
    String? password,
    String? passwordConfirm,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [
            uid,
            token,
            password,
            passwordConfirm,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [SecureStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockSecureStorageService extends _i1.Mock
    implements _i12.SecureStorageService {
  @override
  _i6.Future<void> setToken(_i13.Token? token) => (super.noSuchMethod(
        Invocation.method(
          #setToken,
          [token],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<String> getAccessToken() => (super.noSuchMethod(
        Invocation.method(
          #getAccessToken,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
        returnValueForMissingStub: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> getRefreshToken() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshToken,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
        returnValueForMissingStub: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<String> getRefreshTokenForBiometrics() => (super.noSuchMethod(
        Invocation.method(
          #getRefreshTokenForBiometrics,
          [],
        ),
        returnValue: _i6.Future<String>.value(''),
        returnValueForMissingStub: _i6.Future<String>.value(''),
      ) as _i6.Future<String>);
  @override
  _i6.Future<void> deleteToken() => (super.noSuchMethod(
        Invocation.method(
          #deleteToken,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  _i6.Future<void> deleteAll() => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i14.UserRepository {
  @override
  _i6.Future<_i3.Response> fetchMe(String? accessToken) => (super.noSuchMethod(
        Invocation.method(
          #fetchMe,
          [accessToken],
        ),
        returnValue: _i6.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #fetchMe,
            [accessToken],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #fetchMe,
            [accessToken],
          ),
        )),
      ) as _i6.Future<_i3.Response>);
}

/// A class which mocks [OtpRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOtpRepository extends _i1.Mock implements _i15.OtpRepository {
  @override
  _i6.Future<_i3.Response> fetch(String? accessToken) => (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [accessToken],
        ),
        returnValue: _i6.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #fetch,
            [accessToken],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #fetch,
            [accessToken],
          ),
        )),
      ) as _i6.Future<_i3.Response>);
}

/// A class which mocks [SharedPreferencesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesRepository extends _i1.Mock
    implements _i16.SharedPreferencesRepository {
  @override
  _i6.Future<void> writeBool(
    String? key,
    bool? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #writeBool,
          [
            key,
            value,
          ],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
  @override
  bool? readBool(String? key) => (super.noSuchMethod(
        Invocation.method(
          #readBool,
          [key],
        ),
        returnValueForMissingStub: null,
      ) as bool?);
}
