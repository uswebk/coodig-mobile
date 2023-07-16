class ApiValidationException implements Exception {
  final Map<String, dynamic> errors;
  final int statusCode;

  ApiValidationException(this.errors, this.statusCode);

  Map<String, String> toMap() {
    Map<String, String> errors = {};
    this.errors.forEach((String key, dynamic value) {
      errors[key] = value[0].toString();
    });

    return errors;
  }
}
