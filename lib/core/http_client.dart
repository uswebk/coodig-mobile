import 'dart:convert';

import 'package:http/http.dart' as http;

const host = 'http://127.0.0.1:9999';

class HttpClient {
  Future<http.Response> post(String path, body) async {
    return await http.post(Uri.parse(host + path),
        headers: {'content-type': 'application/json'}, body: jsonEncode(body));
  }
}
