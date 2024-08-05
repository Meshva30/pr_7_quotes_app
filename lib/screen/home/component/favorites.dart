import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_quotes_app/screen/home/component/showquotes.dart';
import '../../../controller/quotes_controller.dart';
import '../../../model/quotes_model.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      body: Obx(() {
        if (homeController.likedQuotesList.isEmpty) {
          return const Center(
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

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: categorizedQuotes.keys.length,
          itemBuilder: (context, index) {
            String category = categorizedQuotes.keys.elementAt(index);
            List<Quote> quotes = categorizedQuotes[category]!;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Showquotes(
                      category: category,
                      quotes: quotes,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.blue.shade100,
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
