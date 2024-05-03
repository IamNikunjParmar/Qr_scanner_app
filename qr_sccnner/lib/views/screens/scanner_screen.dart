import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
import 'package:qr_sccnner/utils/my_routes_utils.dart';
import 'package:qr_sccnner/views/screens/barcode_scan.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScannerWidget();
  }
}

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({super.key});

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  TextEditingController valueController = TextEditingController();
  String displayedValue = '';
  bool showQrCode = false;
  bool eventMode = false;
  bool infoMode = false;
  String scannedResult = '';

  Future<void> startScan() async {
    var result;
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          '#FFFFFF', 'cancel', true, ScanMode.QR);
    } on PlatformException catch (e) {
      result = "Failed to get Platform version";
      Get.snackbar('Error Occured', e.code);
    } catch (e) {
      Get.snackbar('Error occured', e.toString());
    }
    if (!mounted) return;
    setState(() {
      scannedResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff202020),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.5,
                          color: const Color(0xff8861D4),
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/3.jpg'),
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  IconButton(
                    color: const Color(0xff8861D4),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: const Color(0xff8861D4),
                          title: const Text(
                            'Enter Name',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  controller: valueController,
                                  onChanged: (newValue) {
                                    setState(() {
                                      displayedValue = newValue;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter generator QR Code",
                                    labelText: "Generator QR Code",
                                    labelStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 35,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context, valueController.text);
                                  },
                                  child: const Text("Done"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  // Spacer(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                displayedValue.isEmpty
                    ? "Please Enter Your Name"
                    : displayedValue,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showQrCode = true;
                  });
                },
                child: const Text(
                  "show my QR code",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              if (showQrCode)
                valueController.text.isEmpty
                    ? Container()
                    : QrImageView(
                        data: displayedValue,
                        version: QrVersions.auto,
                        size: 220.0,
                        backgroundColor: const Color(0xff865CD0),
                      ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Spacer(),
                  const Text(
                    'Event Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 140),
                  Switch(
                    value: eventMode,
                    onChanged: (value) {
                      setState(() {
                        eventMode = value;
                      });
                    },
                  ),
                  const Spacer(),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: "Enter Your Event Name",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                              color: Color(0xff8861D4),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xff202020),
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      const Text(
                        'Share Your Info',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 110),
                      Switch(
                        value: infoMode,
                        onChanged: (value) {
                          setState(() {
                            infoMode = value;
                          });
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            startScan().then(
              (value) => Navigator.of(context)
                  .pushNamed(MyRoutes.barCodeScan, arguments: scannedResult),
            );
          },
          backgroundColor: const Color(0xff865CD0),
          child: const Icon(
            Icons.document_scanner_outlined,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }
}
