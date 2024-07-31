
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/quotes_model.dart';

class QuoteApiHelper {
  static const String apiUrl = 'https://sheetdb.io/api/v1/jzuaa2yk994jo';
  Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      print('API Response: $data'); // Debug the response
      return data.map((quoteJson) => Quote.fromMap(quoteJson)).toList();
    } else {
      print('Error fetching quotes: ${response.statusCode}'); // Debug errors
      throw Exception('Failed to load quotes');
    }
  }


}
