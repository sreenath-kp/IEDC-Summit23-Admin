import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/models/attendee_model.dart';
import 'package:summit_admin_app/providers/firebase_providers.dart';
import 'package:summit_admin_app/respository/firebase_repo.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
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
                  onDetect: (capture) async {
                    final id = capture.barcodes[0].rawValue.toString();
                    final Attendee? userData = await FirebaseRepo(
                            firestore: ref.watch(firestoreProvider))
                        .getDatabyId(id);
                  },
                ),
              ),
            ),
            HomeButton(title: "Enter ID manually", func: () {})
          ],
        ),
      ),
    );
  }
}
