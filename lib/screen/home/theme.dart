import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_quotes_app/controller/quotes_controller.dart';

class BackgroundSelectionScreen extends StatelessWidget {
  final QuotesController wallpaperController = Get.put(QuotesController());
  final List<String> imglist = [
    'assets/img/theme/img1.jpeg',
    'assets/img/theme/img2.jpeg',
    'assets/img/theme/img3.jpeg',
    'assets/img/theme/img4.jpeg',
    'assets/img/theme/img5.jpeg',
    'assets/img/theme/img6.jpeg',
    'assets/img/theme/img7.jpeg',
    'assets/img/theme/img8.jpeg',
    'assets/img/theme/img9.jpeg',
    'assets/img/theme/img10.jpeg',
    'assets/img/theme/img11.jpeg',
    'assets/img/theme/img12.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: imglist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  wallpaperController.selectedBackground(imglist[index]);
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imglist[index]))),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
