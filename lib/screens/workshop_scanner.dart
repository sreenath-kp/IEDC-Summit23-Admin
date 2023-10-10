import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:summit_admin_app/components/home_button.dart';
import 'package:summit_admin_app/components/workshop_manualsub.dart';
import 'package:summit_admin_app/screens/workshop_user_id_screen.dart';

class WorkshopScannerScreen extends StatefulWidget {
  final String wsName;
  const WorkshopScannerScreen({
    Key? key,
    required this.wsName,
  }) : super(key: key);

  @override
  State<WorkshopScannerScreen> createState() => _WorkshopScannerScreenState();
}

class _WorkshopScannerScreenState extends State<WorkshopScannerScreen> {
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

  void routeToUserIDScreen(String id, String wsName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkshopUserIDScreen(
          id: id,
          screenClosed: _screenClosed,
          wsName: wsName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String id;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
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
                      id = capture.barcodes[0].rawValue.toString();
                      _screenOpened = true;
                      routeToUserIDScreen(id, widget.wsName);
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
                    child: WSManualSub(
                      wsName: widget.wsName,
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
