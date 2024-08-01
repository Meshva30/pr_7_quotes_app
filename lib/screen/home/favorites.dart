//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/quotes_controller.dart';
// import '../../model/quotes_model.dart';
//
// class FavoritesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final QuotesController quotesController = Get.put(QuotesController());
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorites')),
//       body: Obx(() {
//         List<Quote> likedQuotes = quotesController.quotes.where((quote) => quote.liked).toList();
//         return ListView.builder(
//           itemCount: likedQuotes.length,
//           itemBuilder: (context, index) {
//             var quote = likedQuotes[index];
//             return ListTile(
//               title: Text(quote.quote),
//               subtitle: Text(quote.author),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
