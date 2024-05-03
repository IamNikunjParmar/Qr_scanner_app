import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          "",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
