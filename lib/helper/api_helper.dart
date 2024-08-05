import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiUrl = 'https://sheetdb.io/api/v1/jzuaa2yk994jo';
  static const int timeoutDuration = 10;

  Future<List<dynamic>?> apiCalling() async {
    try {
      final response = await http
          .get(Uri.parse(apiUrl))
          .timeout(const Duration(seconds: timeoutDuration));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
