import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp.freezed.dart';
part 'otp.g.dart';

@freezed
class Otp with _$Otp {
  const factory Otp({
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'expiration_at') required String expirationAt,
  }) = _Otp;

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);
}
