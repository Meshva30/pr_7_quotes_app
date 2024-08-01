import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/quotes_controller.dart';
import '../../model/quotes_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
      ),
      body: Obx(() {
        if (homeController.likedQuotesList.isEmpty) {
          return Center(
            child: Text('No favorite quotes found.'),
          );
        }

        Map<String, List<Quote>> categorizedQuotes = {};
        for (var quote in homeController.likedQuotesList) {
          if (!categorizedQuotes.containsKey(quote.category)) {
            categorizedQuotes[quote.category] = [];
          }
          categorizedQuotes[quote.category]!.add(quote);
        }

        return ListView(
          children: categorizedQuotes.entries.map((entry) {
            return ExpansionTile(
              title: Text(entry.key),
              children: entry.value.map((quote) {
                return ListTile(
                  title: Text(quote.quote),
                  subtitle: Text('- ${quote.author}'),
                );
              }).toList(),
            );
          }).toList(),
        );
      }),
    );
  }
}
