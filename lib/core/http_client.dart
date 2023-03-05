import 'dart:convert';

import 'package:http/http.dart' as http;

const host = 'http://127.0.0.1:9999';

class HttpClient {
  Future<http.Response> post(String path, Map<String, String> body) async {
    try {
      return await http
          .post(Uri.parse(host + path),
              headers: {'content-type': 'application/json'},
              body: jsonEncode(body))
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response('TimeOut', 408);
        },
      );
    } catch (e) {
      return http.Response(
          jsonEncode({
            'errors': {
              'message': ['Server Error']
            }
          }),
          500);
    }
  }
}
