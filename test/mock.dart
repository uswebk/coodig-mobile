import 'package:coodig_mobile/core/datetime.dart';
import 'package:coodig_mobile/repository/otp_repository.dart';
import 'package:coodig_mobile/repository/shared_preferences_repository.dart';
import 'package:coodig_mobile/repository/user_repository.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:coodig_mobile/service/environment_service.dart';
import 'package:coodig_mobile/service/secure_storage_service.dart';
import 'package:coodig_mobile/service/splash_service.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<DateTimeCore>(),
  MockSpec<DeeplinkService>(),
  MockSpec<SplashService>(),
  MockSpec<EnvironmentService>(),
  MockSpec<AuthService>(),
  MockSpec<SecureStorageService>(),
  MockSpec<UserRepository>(),
  MockSpec<OtpRepository>(),
  MockSpec<SharedPreferencesRepository>(),
])
Future<void> main() async {}
