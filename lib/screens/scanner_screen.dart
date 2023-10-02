import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/screens/user_id_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _screenOpened = false;
  String result = " ";
  String name = "";
  void _screenClosed() {
    _screenOpened = !_screenOpened;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                width: 292,
                height: 292,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(
                      width: 5,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                child: MobileScanner(
                  fit: BoxFit.fill,
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.normal,
                    facing: CameraFacing.back,
                    torchEnabled: false,
                  ),
                  onDetect: (capture) {
                    if (!_screenOpened) {
                      final id = capture.barcodes[0].rawValue.toString();
                      _screenOpened = true;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserIDScreen(
                            id: id,
                            screenClosed: _screenClosed,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            HomeButton(
              title: "Enter ID manually",
              func: () {},
            )
          ],
        ),
      ),
    );
  }
}
