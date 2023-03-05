import 'dart:convert';

import 'package:http/http.dart' as http;

const host = 'http://127.0.0.1:9999';

class HttpAuthClient {
  Future<http.Response> get(
      String path, Map<String, String> query, String accessToken) async {
    final uri = Uri.parse(host + path).replace(queryParameters: query);

    try {
      return await http.get(
        uri,
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          return http.Response(
              jsonEncode({
                'errors': {
                  'message': ['TimeOut']
                }
              }),
              408);
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
