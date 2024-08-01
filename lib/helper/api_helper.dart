import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiUrl = 'https://sheetdb.io/api/v1/jzuaa2yk994jo';

  Future<List<dynamic>?> apiCalling() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Error fetching quotes: ${response.statusCode}');
      return null;
    }
  }
}
