import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';

class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  /// Sunucu ayakta mı? Cevap gelmezse ya da 200 dönmezse false.
  Future<bool> isServerUp() async {
    try {
      final res = await _client
          .get(Uri.parse('$apiUrl/api/health'))
          .timeout(const Duration(seconds: 5));
      if (res.statusCode != 200) return false;
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return body['status'] == 'ok';
    } catch (_) {
      return false;
    }
  }
}
