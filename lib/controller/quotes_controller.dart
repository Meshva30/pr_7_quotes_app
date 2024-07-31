
import 'package:get/get.dart';
import '../helper/api_helper.dart';
import '../helper/db_helper.dart';

import '../model/quotes_model.dart';

class QuotesController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  void fetchQuotes() async {
    isLoading(true);

    var localQuotes = await DatabaseHelper.instance.fetchQuotes();
    if (localQuotes.isNotEmpty) {
      quotes.assignAll(localQuotes);
      isLoading(false);
      return;
    }


    try {
      var apiQuotes = await QuoteApiHelper().fetchQuotes();
      if (apiQuotes.isNotEmpty) {
        for (var quote in apiQuotes) {
          await DatabaseHelper.instance.insertQuote(quote);
        }
        quotes.assignAll(apiQuotes);
      } else {
        quotes.assignAll([]);
      }
    } catch (e) {
      print('Error fetching quotes: $e');
      quotes.assignAll([]);
    }

    isLoading(false);
  }
}
