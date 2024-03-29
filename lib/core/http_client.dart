import 'dart:convert';

import 'package:coodig_mobile/core/environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final httpClientProvider = Provider((ref) => HttpClient(ref.watch(environmentProvider)));

class HttpClient {
  HttpClient(this._environment);

  final Environment _environment;

  Future<http.Response> get(String path, Map<String, String> query, String accessToken) async {
    Map<String, String> headers = {'content-type': 'application/json'};

    String host = _environment.getEndpoint();

    if (accessToken != '') {
      headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

    try {
      return await http.get(Uri.parse(host + path).replace(queryParameters: query), headers: headers).timeout(
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

  Future<http.Response> post(String path, Map<String, dynamic> body, String accessToken) async {
    Map<String, String> headers = {'content-type': 'application/json'};

    String host = _environment.getEndpoint();

    if (accessToken != '') {
      headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

    try {
      return await http.post(Uri.parse(host + path), headers: headers, body: jsonEncode(body)).timeout(
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
