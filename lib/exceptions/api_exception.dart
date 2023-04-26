class ApiException implements Exception {
  final Map<String, dynamic> errors;

  ApiException(this.errors);
}
