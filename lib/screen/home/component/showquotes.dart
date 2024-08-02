import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/quotes_controller.dart';
import '../../../helper/db_helper.dart';
import '../../../model/quotes_model.dart';

class Showquotes extends StatelessWidget {
  final String category;
  final List<Quote> quotes;
  final HomeController homeController = Get.find();

  Showquotes({
    required this.category,
    required this.quotes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: quotes.map((quote) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(quote.quote),
              subtitle: Text('- ${quote.author}'),

            ),
          );
        }).toList(),
      ),
    );
  }
}
