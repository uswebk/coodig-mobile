import 'package:http/http.dart' as http;

const host = 'http://127.0.0.1:9999';

class HttpAuthClient {
  Future<http.Response> get(
      String path, Map<String, String> query, String accessToken) async {
    final uri = Uri.parse(host + path).replace(queryParameters: query);
    return await http.get(
      uri,
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );
  }
}
