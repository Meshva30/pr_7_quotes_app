import 'package:flutter/material.dart';
import 'package:pr_7_quotes_app/screen/home/homescreen.dart';

class Intro2 extends StatefulWidget {
  @override
  _Intro2State createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.easeIn),
    );

    // Start the animation after a delay
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        _controller!.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering the entire screen
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/theme/bg2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content over the background image
          Padding(
            padding: const EdgeInsets.all(16.0), // Adjust padding as needed
            child: Column(
              children: [
                SizedBox(height: 100), // Adjust top position as needed
                FadeTransition(
                  opacity: _opacityAnimation!,
                  child: Text(
                    'Explore What matters \n most to you',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                FadeTransition(
                  opacity: _opacityAnimation!,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Discover Personalized content based on your unique goals and aspirations.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black, // Change color for contrast
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                // Rows of buttons with spacing
                _buildButtonRow('Self Care', 'Self Care'),
                SizedBox(height: 10),
                _buildButtonRow('Self Care', 'Self Care'),
                SizedBox(height: 10),
                _buildButtonRow('Self Care', 'Self Care'),
                SizedBox(height: 10),
                _buildButtonRow('Self Care', 'Self Care'),
                Spacer(),
                // Pushes the following content (the button) to the bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow(String label1, String label2) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(right: 10), // Add spacing between buttons
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5)),
            child: Center(
                child: Text(
                  label1,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(left: 10), // Add spacing between buttons
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5)),
            child: Center(
                child: Text(
                  label2,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
          ),
        ),
      ],
    );
  }
}
