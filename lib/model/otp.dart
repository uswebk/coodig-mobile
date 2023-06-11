class Otp {
  final String code;
  final DateTime expirationAt;

  Otp({
    required this.code,
    required this.expirationAt,
  });

  factory Otp.fromJson(Map<String, dynamic> json) {
    return Otp(
      code: json['code'].toString(),
      expirationAt: DateTime.parse(json['expiration_at'].toString()),
    );
  }
}
