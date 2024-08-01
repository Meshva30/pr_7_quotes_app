import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }

  ThemeData get theme => isDarkTheme.value ? ThemeData.dark() : ThemeData.light();
}