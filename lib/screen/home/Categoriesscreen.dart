import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Unlock All',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategorySection(
                      title: 'General',
                      items: [
                        CategoryItem(
                          icon: Icons.circle,
                          label: 'General',
                          color: Colors.green.shade100,
                        ),
                        CategoryItem(
                          icon: Icons.favorite,
                          label: 'Your Favorites',
                          color: Colors.green.shade100,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Find Moments of Inner Peace',
                      items: [
                        CategoryItem(
                          icon: Icons.nightlight_round,
                          label: 'Find Restful Sleep',
                          color: Colors.blue.shade100,
                          isLocked: true,
                        ),
                        CategoryItem(
                          icon: Icons.spa,
                          label: 'Achieve Calmness',
                          color: Colors.blue.shade100,
                          isLocked: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Dive Deep into Your Thoughts',
                      items: [
                        CategoryItem(
                          icon: Icons.lightbulb_outline,
                          label: 'Inspiring Questions',
                          color: Colors.purple.shade100,
                          isLocked: true,
                        ),
                        CategoryItem(
                          icon: Icons.mic,
                          label: 'Confronting Beliefs',
                          color: Colors.purple.shade100,
                          isLocked: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Cultivate Daily Gratitude',
                      items: [
                        CategoryItem(
                          icon: Icons.fitness_center,
                          label: 'Expressing Gratitude',
                          color: Colors.green.shade100,
                          isLocked: true,
                        ),
                        CategoryItem(
                          icon: Icons.ac_unit,
                          label: 'Cultivate Gratitude',
                          color: Colors.green.shade100,
                          isLocked: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Fuel Your Inner Flame',
                      items: [
                        CategoryItem(
                          icon: Icons.handshake,
                          label: 'Find Strength in Faith',
                          color: Colors.blue.shade100,
                          isLocked: true,
                        ),
                        CategoryItem(
                          icon: Icons.yard_outlined,
                          label: 'Connect Spiritually',
                          color: Colors.blue.shade100,
                          isLocked: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Ignite Your Ambitions',
                      items: [
                        CategoryItem(
                          icon: Icons.sunny,
                          label: 'Embrace Fresh Starts',
                          color: Colors.purple.shade100,
                          isLocked: true,
                        ),
                        CategoryItem(
                          icon: Icons.gps_off,
                          label: 'Set Meaningful Goals',
                          color: Colors.purple.shade100,
                          isLocked: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Overcome Relationship Challenges',
                      items: [
                        CategoryItem(
                          icon: Icons.handshake_outlined,
                          label: 'Visuailze Parenthood',
                          color: Colors.green.shade100,
                          isLocked: true,
                        ),
                        CategoryItem(
                          icon: Icons.join_inner,
                          label: 'Nurture Your Partnership',
                          color: Colors.green.shade100,
                          isLocked: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection(
      {required String title, required List<CategoryItem> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 3 / 2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isLocked;

  const CategoryItem({
    required this.icon,
    required this.label,
    required this.color,
    this.isLocked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 55, color: Colors.black),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
