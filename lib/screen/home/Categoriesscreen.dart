import 'package:flutter/material.dart';

import 'homescreen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<bool> selectedItems = List<bool>.filled(18, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Categories',
        ),
        leading: IconButton(
          icon: const Icon(Icons.close,),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle unlock all action
            },
            child: const Text(
              'Unlock All',
              style: TextStyle(),
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
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,

              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategorySection(
                      title: 'General',
                      items: [
                        CategoryItem(
                          icon: Icons.favorite,
                          label: 'Love',
                          color: Colors.green.shade100,
                          isSelected: selectedItems[0],
                          onTap: () => _handleItemTap(0),
                        ),
                        CategoryItem(
                          icon: Icons.ac_unit,
                          label: 'Affirmation',
                          color: Colors.green.shade100,
                          isSelected: selectedItems[1],
                          onTap: () => _handleItemTap(1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Find Moments of Inner Peace',
                      items: [
                        CategoryItem(
                          icon: Icons.motion_photos_off,
                          label: 'Motivation',
                          color: Colors.blue.shade100,
                          isLocked: true,
                          isSelected: selectedItems[2],
                          onTap: () => _handleItemTap(2),
                        ),
                        CategoryItem(
                          icon: Icons.spa,
                          label: 'Positive',
                          color: Colors.blue.shade100,
                          isLocked: true,
                          isSelected: selectedItems[3],
                          onTap: () => _handleItemTap(3),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Dive Deep into Your Thoughts',
                      items: [
                        CategoryItem(
                          icon: Icons.ac_unit,
                          label: 'Mental Health',
                          color: Colors.purple.shade100,
                          isLocked: true,
                          isSelected: selectedItems[4],
                          onTap: () => _handleItemTap(4),
                        ),
                        CategoryItem(
                          icon: Icons.line_axis_outlined,
                          label: 'Discipline',
                          color: Colors.purple.shade100,
                          isLocked: true,
                          isSelected: selectedItems[5],
                          onTap: () => _handleItemTap(5),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Cultivate Daily Gratitude',
                      items: [
                        CategoryItem(
                          icon: Icons.heart_broken_rounded,
                          label: 'Broken',
                          color: Colors.green.shade100,
                          isLocked: true,
                          isSelected: selectedItems[6],
                          onTap: () => _handleItemTap(6),
                        ),
                        CategoryItem(
                          icon: Icons.self_improvement,
                          label: 'Self Esteem',
                          color: Colors.green.shade100,
                          isLocked: true,
                          isSelected: selectedItems[7],
                          onTap: () => _handleItemTap(7),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Fuel Your Inner Flame',
                      items: [
                        CategoryItem(
                          icon: Icons.supervised_user_circle,
                          label: 'Success',
                          color: Colors.blue.shade100,
                          isLocked: true,
                          isSelected: selectedItems[8],
                          onTap: () => _handleItemTap(8),
                        ),
                        CategoryItem(
                          icon: Icons.handshake_outlined,
                          label: 'Friendship',
                          color: Colors.blue.shade100,
                          isLocked: true,
                          isSelected: selectedItems[9],
                          onTap: () => _handleItemTap(9),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Ignite Your Ambitions',
                      items: [
                        CategoryItem(
                          icon: Icons.loyalty,
                          label: 'Loyalty',
                          color: Colors.purple.shade100,
                          isLocked: true,
                          isSelected: selectedItems[10],
                          onTap: () => _handleItemTap(10),
                        ),
                        CategoryItem(
                          icon: Icons.emoji_emotions_outlined,
                          label: 'Kindness',
                          color: Colors.purple.shade100,
                          isLocked: true,
                          isSelected: selectedItems[11],
                          onTap: () => _handleItemTap(11),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildCategorySection(
                      title: 'Overcome Relationship Challenges',
                      items: [
                        CategoryItem(
                          icon: Icons.emoji_emotions,
                          label: 'Funny',
                          color: Colors.green.shade100,
                          isLocked: true,
                          isSelected: selectedItems[12],
                          onTap: () => _handleItemTap(12),
                        ),
                        CategoryItem(
                          icon: Icons.emoji_emotions_rounded,
                          label: 'Happy',
                          color: Colors.green.shade100,
                          isLocked: true,
                          isSelected: selectedItems[13],
                          onTap: () => _handleItemTap(13),
                        ),
                      ],
                    ),
                    _buildCategorySection(
                      title: 'Overcome Relationship Challenges',
                      items: [
                        CategoryItem(
                          icon: Icons.sentiment_dissatisfied_rounded,
                          label: 'Sed',
                          color: Colors.green.shade100,
                          isLocked: true,
                          isSelected: selectedItems[12],
                          onTap: () => _handleItemTap(12),
                        ),
                        CategoryItem(
                          icon: Icons.emoji_emotions,
                          label: 'Ego',
                          color: Colors.green.shade100,
                          isLocked: true,
                          isSelected: selectedItems[13],
                          onTap: () => _handleItemTap(13),
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

  Widget _buildCategorySection({
    required String title,
    required List<CategoryItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 2.5,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ],
    );
  }

  void _handleItemTap(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
    });


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isLocked;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.isLocked = false,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orangeAccent : color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 55, color: Colors.black),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500,color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
