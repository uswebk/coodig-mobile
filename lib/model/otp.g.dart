// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Otp _$$_OtpFromJson(Map<String, dynamic> json) => _$_Otp(
      code: json['code'] as String,
      expirationAt: json['expiration_at'] as String,
    );

Map<String, dynamic> _$$_OtpToJson(_$_Otp instance) => <String, dynamic>{
      'code': instance.code,
      'expiration_at': instance.expirationAt,
    };
