import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  MobileScannerController? controller = MobileScannerController();
  bool isFlashOn = false;
  bool isFrontCamera = false;

  @override
  void reassemble() {
    super.reassemble();
    if (defaultTargetPlatform == TargetPlatform.android) {
      controller!.stop();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      controller!.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: MobileScanner(
              key: qrKey,
              onDetect: (barcode, args) {
                final String code = barcode.rawValue!;
                debugPrint('Barcode found! $code');
              },
              controller: controller,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    await controller?.toggleTorch();
                    setState(() {
                      isFlashOn = !isFlashOn;
                    });
                  },
                  icon: Icon(isFlashOn ? Icons.flash_off : Icons.flash_on),
                  label: Text(isFlashOn ? "Turn off Flash" : "Turn on Flash"),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (controller != null) {
                      if (isFrontCamera) {
                        await controller!.switchCamera();
                      } else {
                        await controller!.switchCamera();
                      }
                      setState(() {
                        isFrontCamera = !isFrontCamera;
                      });
                    }
                  },
                  icon: Icon(isFrontCamera ? Icons.camera_rear : Icons.camera_front),
                  label: Text(isFrontCamera ? "Rear Camera" : "Front Camera"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
