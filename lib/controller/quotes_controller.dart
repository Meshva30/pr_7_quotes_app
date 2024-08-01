import 'package:get/get.dart';
import 'dart:developer';

import '../helper/api_helper.dart';
import '../model/quotes_model.dart';

class HomeController extends GetxController {
  var quotesList = <Quote>[].obs;
  var isLoading = true.obs;
  var selectedBackground = 'assets/img/theme/img.jpeg'.obs; // Default background image

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
}
