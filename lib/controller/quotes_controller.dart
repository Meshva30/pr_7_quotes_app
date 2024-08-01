import 'dart:math'; // Importing Random
import 'package:get/get.dart';  // Importing GetX
import 'dart:developer'; // Importing the log function

import '../helper/api_helper.dart';
import '../helper/db_helper.dart';
import '../model/quotes_model.dart';

class HomeController extends GetxController {
  var quotesList = <Quote>[].obs;
  var isLoading = true.obs;
  var selectedBackground = 'assets/img/theme/img.jpeg'.obs;
  var likedQuotesList = <Quote>[].obs;
  var currentQuoteIndex = 0.obs; // Observable for the current quote index

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
      // log('--- Fetched Data ---');
    } else {
      // log('--- Null Data ---');
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


  }

  Future<void> fetchLikedQuotes() async {
    likedQuotesList.value = await DBHelper().getLikedQuotes();
  }

  void randomizeQuotes() {
    final random = Random();
    quotesList.shuffle(); // Shuffle the list
    currentQuoteIndex.value = random.nextInt(quotesList.length); // Pick a random index
  }
}
