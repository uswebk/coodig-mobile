class ApiException implements Exception {
  final Map<String, dynamic> errors;

  ApiException(this.errors);

  Map<String, String> toMap() {
    Map<String, String> errors = {};
    this.errors.forEach((String key, dynamic value) {
      errors[key] = value[0].toString();
    });

    return errors;
  }
}
