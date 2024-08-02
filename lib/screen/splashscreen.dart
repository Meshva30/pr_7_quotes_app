import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_quotes_app/screen/intro1.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.to(Intro1());
    });
    return Scaffold(
      backgroundColor: const Color(0xff156F99),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ClipRect(
          child: Image.asset(
            "assets/img/theme/logo.webp",

          ),
        ),
      ),
    );
  }
}
