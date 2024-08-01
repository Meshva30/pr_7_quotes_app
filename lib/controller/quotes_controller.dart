
import 'package:get/get.dart';  // Importing GetX
  // Importing the DBHelper
import 'dart:developer';

import '../helper/api_helper.dart';
import '../helper/db_helper.dart';
import '../model/quotes_model.dart';  // Importing the log function

class HomeController extends GetxController {
  var quotesList = <Quote>[].obs;
  var isLoading = true.obs;
  var selectedBackground = 'assets/img/theme/img.jpeg'.obs;
  var likedQuotesList = <Quote>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  Future<void> fetchQuotes() async {
    isLoading(true);
    List<dynamic>? jsonData = await ApiServices().apiCalling();
    if (jsonData != null) {
      quotesList.value = jsonData.map((data) => Quote.fromMap(data)).toList();
      log('--- Fetched Data ---');
    } else {
      log('--- Null Data ---');
    }
    isLoading(false);
  }

  void setBackground(String path) {
    selectedBackground.value = path;
  }

  void likeQuote(int index) {
    var quote = quotesList[index];
    quote.liked = !quote.liked;
    quotesList[index] = quote;

    if (quote.liked) {
      likedQuotesList.add(quote);
    } else {
      likedQuotesList.remove(quote);
    }

    // Update the database
    DBHelper().updateQuote(quote);
  }

  Future<void> fetchLikedQuotes() async {
    likedQuotesList.value = await DBHelper().getLikedQuotes();
  }
}
