


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pr_7_quotes_app/controller/quotes_controller.dart';
import 'package:pr_7_quotes_app/controller/theme_controller.dart';
import 'package:share_extend/share_extend.dart';


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
                      padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCircleIconButton(
                            icon: themeController.isDarkTheme.value ? Icons.dark_mode : Icons.light_mode,
                            onPressed: () {
                              themeController.toggleTheme();
                            },
                          ),
                          _buildCircleIconButton(
                            icon: Icons.person,
                            onPressed: () {
                              Get.toNamed('/profile');
                            },
                          ),
                        ],
                      ),
                    ),
                    // _buildTopBar(context, themeController),
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.vertical,
                        itemCount: homeController.quotesList.length,
                        onPageChanged: (index) {
                          homeController.currentQuoteIndex.value = index;
                        },
                        itemBuilder: (context, index) {
                          var quote = homeController.quotesList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    // _buildBottomActions(homeController, pageController),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildCircleIconButton(
                            icon: Icons.share,
                            onPressed: () async {
                              final currentIndex = homeController.currentQuoteIndex.value;
                              final quote = homeController.quotesList[currentIndex];
                              await ShareExtend.share(
                                  '${quote.quote} - ${quote.author}',
                                  'text',
                                  subject: 'Quote by ${quote.author}'
                              );
                            },
                          ),
                          const SizedBox(width: 20),
                          Obx(() {
                            final currentIndex = homeController.currentQuoteIndex.value;
                            final quote = homeController.quotesList[currentIndex];
                            final isLiked = quote.liked;

                            return _buildCircleIconButton(
                              icon: isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.white,
                              onPressed: () {
                                homeController.likeQuote(currentIndex);
                              },
                            );
                          }),
                          const SizedBox(width: 20),
                          _buildCircleIconButton(
                            icon: Icons.text_fields,
                            onPressed: () {
                              // Handle text size action
                            },
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
                        color: const Color(0xff2F2F2F),
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
                    // _buildBottomNavBar(),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildCircleIconButton({required IconData icon, required VoidCallback onPressed, Color color = Colors.white}) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        color: Color(0xff2F2F2F),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }

}



class BottomNavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, color: Colors.white),
          const SizedBox(height: 5),
          Text(
            widget.label,
            style: const TextStyle(color: Colors.white,fontSize: 10),
          ),
        ],
      ),
    );
  }
}

