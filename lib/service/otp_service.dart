import 'dart:convert';

import 'package:coodig_mobile/model/otp.dart';
import 'package:coodig_mobile/repository/otp_repository.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:coodig_mobile/service/local_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpServiceProvider = Provider((ref) => OtpService(
    ref.watch(authServiceProvider), ref.watch(localStorageServiceProvider), ref.watch(otpRepositoryProvider)));

class OtpService {
  OtpService(
    this._authService,
    this._localStorageService,
    this._otpRepository,
  );

  final AuthService _authService;
  final LocalStorageService _localStorageService;
  final OtpRepository _otpRepository;

  Future<Otp?> fetch() async {
    String accessToken = await _localStorageService.getAccessToken();
    final response = await _otpRepository.fetch(accessToken);

    if (response.statusCode == 200) {
      return Otp.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    if (response.statusCode == 401) {
      await _authService.refresh();
      String accessToken = await _localStorageService.getAccessToken();

      final retryResponse = await _otpRepository.fetch(accessToken);

      if (retryResponse.statusCode == 200) {
        return Otp.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      }
    }

    return null;
  }
}
