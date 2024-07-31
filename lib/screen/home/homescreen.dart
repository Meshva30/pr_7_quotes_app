import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/quotes_controller.dart';

class HomeScreen extends StatelessWidget {
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

        return Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/bg1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                // Top icons
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.surround_sound, color: Colors.white),
                        onPressed: () {
                          // Implement sound settings
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person, color: Colors.white),
                        onPressed: () {
                          // Implement profile settings
                        },
                      ),
                    ],
                  ),
                ),
                // Quotes PageView
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: quotesController.quotes.length,
                    itemBuilder: (context, index) {
                      var quote = quotesController.quotes[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Center(
                          child: Text(
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
                        ),
                      );
                    },
                  ),
                ),
                // Bottom row with action buttons
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                        icon: Icons.share,
                        onPressed: () {
                          // Implement share functionality
                        },
                      ),
                      SizedBox(width: 20),
                      ActionButton(
                        icon: Icons.favorite,
                        onPressed: () {
                          // Implement favorite functionality
                        },
                      ),
                      SizedBox(width: 20),
                      ActionButton(
                        icon: Icons.text_fields,
                        onPressed: () {
                          // Implement text customization functionality
                        },
                      ),
                    ],
                  ),
                ),
                // Custom Bottom Navigation Bar
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
                            // Navigate to favorites screen
                            Get.toNamed('/favorites'); // Example route
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
                            // Open theme selection
                            Get.toNamed('/theme'); // Example route
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
                            // Open Pro features screen
                            Get.toNamed('/pro'); // Example route
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ActionButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const BottomNavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
