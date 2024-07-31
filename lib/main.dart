import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pr_7_quotes_app/screen/home/homescreen.dart';

import 'helper/db_helper.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.addCategoryColumn(); // Ensure this is called to update the schema
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
