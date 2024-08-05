

import 'dart:math';
import 'package:get/get.dart';
import '../helper/api_helper.dart';
import '../helper/db_helper.dart';
import '../model/quotes_model.dart';

class HomeController extends GetxController {
  var quotesList = <Quote>[].obs;
  var isLoading = true.obs;
  var selectedBackground = 'assets/img/theme/img.jpeg'.obs;
  var likedQuotesList = <Quote>[].obs;
  var categoryQuotesList = <Quote>[].obs;
  RxInt currentQuoteIndex = 0.obs;
  var currentCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
    fetchLikedQuotes();
  }

  Future<void> fetchQuotes() async {
    isLoading(true);
    List<dynamic>? jsonData = await ApiServices().apiCalling();
    if (jsonData != null) {
      var fetchedQuotes = jsonData.map((data) => Quote.fromMap(data)).toList();
      fetchedQuotes.shuffle(Random());
      quotesList.value = fetchedQuotes;

      if (quotesList.isNotEmpty) {
        currentCategory.value = quotesList.first.category;
      }
    }
    isLoading(false);
  }

  Future<void> fetchLikedQuotes() async {
    likedQuotesList.value = await DBHelper().getLikedQuotes();
  }

  void setBackground(String path) {
    selectedBackground.value = path;
  }

  void likeQuote(int index) async {
    var quote = quotesList[index];
    bool isLiked = quote.liked;


    quote.liked = !isLiked;
    quotesList[index] = quote;

    if (quote.liked) {
      if (!likedQuotesList.contains(quote)) {
        likedQuotesList.add(quote);
        print("=========add=============== ${likedQuotesList.length}");
      }
      await DBHelper().insertLikedQuote(quote);
    } else {
      if (likedQuotesList.contains(quote)) {
        likedQuotesList.remove(quote);
        print("============remove============ ${likedQuotesList.length}");
      }
      await DBHelper().deleteLikedQuote(quote);
    }


  }
}

