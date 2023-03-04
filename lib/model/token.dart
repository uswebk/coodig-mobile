class Token {
  final String accessToken;
  final String refreshToken;

  Token({required this.accessToken, required this.refreshToken});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(accessToken: json['access'], refreshToken: json['refresh']);
  }
}
