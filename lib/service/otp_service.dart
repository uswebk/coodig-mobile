import 'dart:convert';

import 'package:coodig_mobile/model/otp.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/otp_repository.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));
final otpRepository = Provider((ref) => ref.watch(otpRepositoryProvider));

final otpServiceProvider = Provider(
    (ref) => OtpService(ref.watch(authService), ref.watch(otpRepository)));

class OtpService {
  OtpService(this._authService, this._otpRepository);

  final AuthService _authService;
  final OtpRepository _otpRepository;

  Future<Otp?> fetch() async {
    final response = await _otpRepository.fetch();

    if (response.statusCode == 200) {
      return Otp.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == 401) {
      await _authService.refresh();

      final retryResponse = await _otpRepository.fetch();

      if (retryResponse.statusCode == 200) {
        return Otp.fromJson(jsonDecode(response.body));
      }
    }

    return null;
  }
}
