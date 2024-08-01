import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../helper/db_helper.dart';
import '../model/quotes_model.dart';

class QuotesController extends GetxController {
  final RxList<Quote> quotes = <Quote>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isSelectionMode = false.obs;
  final RxSet<Quote> selectedQuotes = <Quote>{}.obs;
  final PageController pageController = PageController();

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  RxString selectedBackground = 'assets/img/theme/img.jpeg'.obs;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  Future<void> fetchQuotes() async {
    isLoading.value = true;
    try {
      quotes.value = await _dbHelper.fetchQuotes();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> likeQuote(Quote quote) async {
    quote.liked = !quote.liked;
    await _dbHelper.updateQuote(quote);
    quotes.refresh();
  }

  Future<void> likeSelectedQuotes() async {
    List<Quote> updatedQuotes = [];
    for (var quote in selectedQuotes) {
      quote.liked = true;
      updatedQuotes.add(quote);
    }
    await _dbHelper.updateQuotes(updatedQuotes);
    selectedQuotes.clear();
    quotes.refresh();
  }

  void addToSelection(Quote quote) {
    selectedQuotes.add(quote);
    isSelectionMode.value = selectedQuotes.isNotEmpty;
  }

  void removeFromSelection(Quote quote) {
    selectedQuotes.remove(quote);
    isSelectionMode.value = selectedQuotes.isNotEmpty;
  }

  void toggleSelectionMode() {
    isSelectionMode.value = !isSelectionMode.value;
    if (!isSelectionMode.value) {
      selectedQuotes.clear();
    }
  }

  void setSelectedBackground(String backgroundPath) {
    selectedBackground.value = backgroundPath;
  }
}
