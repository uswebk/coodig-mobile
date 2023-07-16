import 'package:coodig_mobile/provider/datetime_provider.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:coodig_mobile/service/environment_service.dart';
import 'package:coodig_mobile/service/splash_service.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<DeeplinkService>(),
  MockSpec<SplashService>(),
  MockSpec<EnvironmentService>(),
  MockSpec<DateTimeService>(),
])
void main() {}