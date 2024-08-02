import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_quotes_app/controller/quotes_controller.dart';
import 'package:pr_7_quotes_app/controller/theme_controller.dart';

import '../../helper/db_helper.dart';

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
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final PageController pageController = PageController();
    final ThemeController themeController = Get.put(ThemeController());

    return Scaffold(
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Stack(
          children: [
            Obx(
              () => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(homeController.selectedBackground.value),
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
                              color: Color(0xff2F2F2F),
                              shape: BoxShape.circle,
                            ),
                            child: Obx(
                              () => IconButton(
                                icon: Icon(
                                    themeController.isDarkTheme.value
                                        ? Icons.dark_mode
                                        : Icons.light_mode,
                                    color: Colors.white),
                                onPressed: () {
                                  themeController.toggleTheme();
                                },
                              ),
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
                              icon:
                                  const Icon(Icons.person, color: Colors.white),
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
                        controller: pageController,
                        scrollDirection: Axis.vertical,
                        itemCount: homeController.quotesList.length,
                        itemBuilder: (context, index) {
                          var quote = homeController.quotesList[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    quote.quote,
                                    style: const TextStyle(
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
                                  const SizedBox(height: 30),
                                  Text(
                                    '- ${quote.author}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white70,
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
                              color: Color(0xff2F2F2F),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon:
                                  const Icon(Icons.share, color: Colors.white),
                              onPressed: () {
                                // homeController.randomizeQuotes();
                                // pageController.jumpToPage(
                                //     homeController.currentQuoteIndex.value);
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff2F2F2F),
                              shape: BoxShape.circle,
                            ),
                            child: Obx(() {
                              final currentIndex = homeController.quotesList
                                  .indexWhere((quote) =>
                                      quote.category ==
                                      homeController.currentcategory.value);
                              final quote =
                                  homeController.quotesList[currentIndex];
                              var isLiked = quote.liked;
                              return IconButton(
                                icon: Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.white,
                                ),
                                onPressed: () {
                                  homeController.likeQuote(currentIndex);
                                  final updatedQuote =
                                      homeController.quotesList[currentIndex];
                                  DBHelper().insertLikedQuote(updatedQuote);
                                },
                              );
                            }),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff2F2F2F),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.text_fields,
                                  color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Container(
                        color: Color(0xff2F2F2F),
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                            const VerticalDivider(
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
                            const VerticalDivider(
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
                            const VerticalDivider(
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
