import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_sccnner/views/screens/explore_screen.dart';
import 'package:qr_sccnner/views/screens/network_screen.dart';
import 'package:qr_sccnner/views/screens/scanner_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const _HomePageContent();
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent({Key? key}) : super(key: key);

  @override
  __HomePageContentState createState() => __HomePageContentState();
}

class __HomePageContentState extends State<_HomePageContent> {
  late PageController pageController;
  int selectedIndex = 0;

  double bottomNavBarHeight = 70;

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _navigationController = CircularBottomNavigationController(selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
    _navigationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = [
      TabItem(
        Icons.explore,
        "Explore",
        const Color(0xff8861D4),
        labelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: selectedIndex == 0 ? Colors.white : Colors.grey,
        ),
        circleStrokeColor:
            selectedIndex == 0 ? Colors.white : Colors.transparent,
      ),
      TabItem(
        FontAwesomeIcons.qrcode,
        "Scan Code",
        const Color(0xff8861D4),
        labelStyle: TextStyle(
          color: selectedIndex == 1 ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        circleStrokeColor:
            selectedIndex == 1 ? Colors.white : Colors.transparent,
      ),
      TabItem(
        FontAwesomeIcons.networkWired,
        "Network",
        const Color(0xff8861D4),
        circleStrokeColor:
            selectedIndex == 2 ? Colors.white : Colors.transparent,
        labelStyle: TextStyle(
          color: selectedIndex == 2 ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff202020),
      bottomNavigationBar: CircularBottomNavigation(
        controller: _navigationController,
        selectedPos: selectedIndex,
        selectedIconColor: Colors.white,
        barBackgroundColor: const Color(0xff010101),
        normalIconColor: Colors.white,
        iconsSize: 30,
        barHeight: bottomNavBarHeight,
        circleStrokeWidth: 1,
        tabItems,
        selectedCallback: (int? selectPos) {
          if (selectPos != null) {
            setState(() {
              print("Clicked button:$selectPos");
              selectedIndex = selectPos;
              pageController.jumpToPage(selectedIndex);
            });
          }
        },
      ),
      body: SizedBox(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
              _navigationController.value = index;
            });
          },
          children: const [
            ExploreScreen(),
            ScannerScreen(),
            NetworkScreen(),
          ],
        ),
      ),
    );
  }
}
