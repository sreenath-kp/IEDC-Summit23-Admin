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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            const SizedBox(height: 20),
            const Text(
              'Scanning...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 70),
            HomeButton(
              title: "Enter ID manually",
              func: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ManualSub(
                      controller: _controller,
                      func: routeToUserIDScreen,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
