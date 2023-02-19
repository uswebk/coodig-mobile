import 'package:http/http.dart' as http;

const host = 'http://127.0.0.1:9999';

class HttpAuthClient {
  Future<http.Response> get(
      String path, Map<String, String> query, String accessToken) async {
    return await http.get(
      Uri.parse(host + path),
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
    );
  }
}
