import 'package:flutter/material.dart';
import 'package:qr_sccnner/utils/my_routes_utils.dart';

class BarCodeScanValue extends StatefulWidget {
  const BarCodeScanValue({super.key});

  @override
  State<BarCodeScanValue> createState() => _BarCodeScanValueState();
}

class _BarCodeScanValueState extends State<BarCodeScanValue> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: const Color(0xff202020),
      appBar: AppBar(
        backgroundColor: const Color(0xff202020),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MyRoutes.home);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 500,
          width: 400,
          decoration: BoxDecoration(
            color: const Color(0xff8861D4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            "Scan Data :  $data ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
