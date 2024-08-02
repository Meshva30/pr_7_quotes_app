import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_quotes_app/screen/home/component/Categoriesscreen.dart';
import 'package:pr_7_quotes_app/screen/home/component/favorites.dart';

import 'package:pr_7_quotes_app/screen/home/homescreen.dart';
import 'package:pr_7_quotes_app/screen/home/component/theme.dart';
import 'package:pr_7_quotes_app/screen/intro1.dart';
import 'package:pr_7_quotes_app/screen/intro2.dart';
import 'package:pr_7_quotes_app/screen/splashscreen.dart';

import 'controller/theme_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeController.theme,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/splash', page: () => const splashscreen()),
          GetPage(name: '/intro1', page: () => Intro1()),
          GetPage(name: '/intro2', page: () => Intro2()),
          GetPage(name: '/', page: () => const HomeScreen()),
          GetPage(
            name: '/categories',
            page: () => const CategoriesScreen(),
          ),
          GetPage(
            name: '/favorites',
            page: () => const FavoriteScreen(),
          ),
          GetPage(
            name: '/background',
            page: () => BackgroundSelectionScreen(),
          ),
        ],
      ),
    );
  }
}
