import 'dart:async';

import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/intro1');
    });
    return Scaffold(
      backgroundColor: Color(0xff156F99),
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
