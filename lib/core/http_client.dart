import 'dart:convert';

import 'package:http/http.dart' as http;

const host = 'http://127.0.0.1:9999';

class HttpClient {
  Future<http.Response> get(
      String path, Map<String, String> query, String accessToken) async {
    final uri = Uri.parse(host + path).replace(queryParameters: query);
    Map<String, String> headers = {'content-type': 'application/json'};

    if (accessToken != '') {
      headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

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

  Future<http.Response> post(
      String path, Map<String, String> body, String accessToken) async {
    Map<String, String> headers = {'content-type': 'application/json'};

    if (accessToken != '') {
      headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

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
