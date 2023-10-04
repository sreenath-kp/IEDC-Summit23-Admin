import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/components/manual_sub.dart';
import 'package:summit_admin_app/screens/user_id_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool _screenOpened = false;
  final TextEditingController _controller = TextEditingController();

  void _screenClosed() {
    _screenOpened = !_screenOpened;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void routeToUserIDScreen(String id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserIDScreen(
          id: id,
          screenClosed: _screenClosed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: ManualSub(controller: _controller)),
                IconButton(
                    onPressed: () {
                      String id = _controller.text;
                      routeToUserIDScreen(id);
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
            Center(
              child: Container(
                width: 292,
                height: 292,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 5, color: Colors.red),
                    left: BorderSide(width: 5, color: Colors.green),
                    right: BorderSide(width: 5, color: Colors.blue),
                    bottom: BorderSide(width: 5, color: Colors.yellow),
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
                      routeToUserIDScreen(id);
                    }
                  },
                ),
              ),
            ),
            const Text(
              'Scanning...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
