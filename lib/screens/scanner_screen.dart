import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:summit_admin_app/components/admit_tile.dart';
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
      appBar: AppBar(
        title: const Text("IEDC-Summit"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MobileScanner(
                  fit: BoxFit.fill,
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.normal,
                    facing: CameraFacing.back,
                    torchEnabled: false,
                  ),
                  onDetect: (capture) async {
                    final id = capture.barcodes[0].rawValue.toString();
                    final userData = await FirebaseRepo(
                            firestore: ref.watch(firestoreProvider))
                        .getDatabyId(id);
                    setState(() {
                      result = id;
                      name = userData!.name;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: AdmitTile(barId: result, name: name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
