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
  var categoryQuotesList=<Quote>[].obs;
  var currentQuoteIndex = 0.obs;
  var currentcategory =''.obs;

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
      var fetchQuotes = quotesList.value = jsonData.map((data) => Quote.fromMap(data)).toList();
      fetchQuotes.shuffle(Random());
      quotesList.value=fetchQuotes;
      if(quotesList.isEmpty)
        {
          currentcategory.value=quotesList.first.category;
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

  // void likeQuote(int index) async {
  //   var quote = quotesList[index];
  //   quote.liked = !quote.liked;
  //   quotesList[index] = quote;
  //
  //   if (quote.liked) {
  //     likedQuotesList.add(quote);
  //   } else {
  //     likedQuotesList.remove(quote);
  //   }
  // }

  void likeQuote(int index) async {
    var quote = quotesList[index];
    quote.liked = !quote.liked;
    quotesList[index] = quote;

    if (quote.liked) {
      likedQuotesList.add(quote);
    } else {
      likedQuotesList.remove(quote);
    }
  }



}
