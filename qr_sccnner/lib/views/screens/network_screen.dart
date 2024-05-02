import 'package:flutter/material.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.yellow,
      child: const Center(
        child: Text(
          "Network",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
