import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return const Scaffold(
      backgroundColor: Color(0xff202020),
      body: Center(
        child: Text(
          'Scanner Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
