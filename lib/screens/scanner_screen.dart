import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/screens/user_id_screen.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  // Attendee? getData(String id) async {

  // }

  String result = " ";
  String name = "";
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
                    final id = capture.barcodes[0].rawValue.toString();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserIDScreen(id: id),
                      ),
                    );
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
