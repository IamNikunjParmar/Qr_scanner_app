import 'package:flutter/material.dart';
import 'package:qr_sccnner/utils/my_routes_utils.dart';
import 'package:qr_sccnner/views/screens/barcode_scan.dart';
import 'package:qr_sccnner/views/screens/explore_screen.dart';
import 'package:qr_sccnner/views/screens/home_screen.dart';
import 'package:qr_sccnner/views/screens/network_screen.dart';
import 'package:qr_sccnner/views/screens/scanner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.scannerScreen: (context) => const ScannerScreen(),
        MyRoutes.exploreScreen: (context) => const ExploreScreen(),
        MyRoutes.networkScreen: (context) => const NetworkScreen(),
        MyRoutes.barCodeScan: (context) => const BarCodeScanValue(),
      },
    );
  }
}
