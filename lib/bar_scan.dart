import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarScan extends StatelessWidget {
  BarScan({Key? key}) : super(key: key);

  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();
    return MobileScanner(
        allowDuplicates: false,
        controller: cameraController,
        onDetect: (barcode, args) {
          final String? code = barcode.rawValue;
          debugPrint('Barcode found! $code');
          Navigator.pop(context,code);
        });
  }
}
