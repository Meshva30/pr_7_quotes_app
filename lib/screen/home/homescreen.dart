import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_extend/share_extend.dart';
import '../../controller/quotes_controller.dart';
import '../../model/quotes_model.dart';

class HomeScreen extends StatelessWidget {
  final int? selectedCategoryIndex;
  HomeScreen({this.selectedCategoryIndex});
  @override
  Widget build(BuildContext context) {
    final QuotesController quotesController = Get.put(QuotesController());
    if (quotesController.quotes.isEmpty) {
      quotesController.fetchQuotes();
    }
    return Scaffold(
      body: Obx(() {
        if (quotesController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (quotesController.quotes.isEmpty) {
          return Center(
            child: Text(
              'No quotes available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        List<Quote> filteredQuotes = [];
        if (selectedCategoryIndex != null) {
          filteredQuotes = quotesController.quotes
              .where(
                  (quote) => quote.category == selectedCategoryIndex.toString())
              .toList();
        } else {
          filteredQuotes = quotesController.quotes;
        }

        return Stack(
          children: [
            Obx(
                  () =>
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            quotesController.selectedBackground.value.isEmpty
                                ? 'assets/img/theme/img.jpeg'
                                : quotesController.selectedBackground.value),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.surround_sound,
                                      color: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.person, color: Colors.white),
                                  onPressed: () {
                                    Get.toNamed('/profile');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: quotesController.pageController,
                            scrollDirection: Axis.vertical,
                            itemCount: filteredQuotes.length,
                            itemBuilder: (context, index) {
                              var quote = filteredQuotes[index];
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        quote.quote,
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 10.0,
                                              color: Colors.black,
                                              offset: Offset(2.0, 2.0),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      if (quotesController.isSelectionMode
                                          .value)
                                        Checkbox(
                                          value: quotesController.selectedQuotes
                                              .contains(quote),
                                          onChanged: (value) {
                                            if (value == true) {
                                              quotesController
                                                  .addToSelection(quote);
                                            } else {
                                              quotesController
                                                  .removeFromSelection(quote);
                                            }
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.share, color: Colors.white),
                                  onPressed: () {
                                    var currentQuote = filteredQuotes.isNotEmpty
                                        ? filteredQuotes[quotesController
                                        .pageController.page
                                        ?.round() ??
                                        0]
                                        : null;
                                    if (currentQuote != null) {
                                      ShareExtend.share(
                                          currentQuote.quote, "text");
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    filteredQuotes.isNotEmpty &&
                                        filteredQuotes[quotesController.currentPage.value].liked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    var currentPage = quotesController.currentPage.value;
                                    if (filteredQuotes.isNotEmpty && currentPage < filteredQuotes.length) {
                                      var currentQuote = filteredQuotes[currentPage];
                                      quotesController.likeQuote(currentQuote);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon:
                                  Icon(Icons.text_fields, color: Colors.white),
                                  onPressed: () {

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Container(
                            color: Color(0xff2F2F2F),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BottomNavItem(
                                  icon: Icons.grid_view,
                                  label: 'Your Favorites',
                                  onTap: () {
                                    Get.toNamed('/favorites');
                                  },
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                  width: 20,
                                ),
                                BottomNavItem(
                                  icon: Icons.grid_view_rounded,
                                  label: 'Category',
                                  onTap: () {
                                    Get.toNamed('/categories');
                                  },
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                  width: 20,
                                ),
                                BottomNavItem(
                                  icon: Icons.image,
                                  label: 'Theme',
                                  onTap: () {
                                    Get.toNamed('/background');
                                  },
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                  width: 20,
                                ),
                                BottomNavItem(
                                  icon: Icons.star,
                                  label: 'Get Pro',
                                  onTap: () {
                                    Get.toNamed('/pro');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ],
        );
      }),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
