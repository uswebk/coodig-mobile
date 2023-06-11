class User {
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;

  User({
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    DateTime? emailVerifiedAt = json['email_verified_at'] != null
        ? DateTime.parse(json['email_verified_at'].toString())
        : null;

    return User(
        name: json['name'].toString(),
        email: json['email'].toString(),
        emailVerifiedAt: emailVerifiedAt);
  }
}
