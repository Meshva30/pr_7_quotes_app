import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_quotes_app/screen/home/Categoriesscreen.dart';
import 'package:pr_7_quotes_app/screen/home/favorites.dart';
import 'package:pr_7_quotes_app/screen/home/homescreen.dart';
import 'package:pr_7_quotes_app/screen/home/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(
          name: '/categories',
          page: () => CategoriesScreen(),
        ),
        GetPage(
          name: '/favorites',
          page: () => FavoritesScreen(),
        ),
        GetPage(
          name: '/background',
          page: () => BackgroundSelectionScreen(),
        ),
      ],
    );
  }
}
