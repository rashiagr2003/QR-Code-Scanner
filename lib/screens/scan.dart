import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
              width: 180,
              child: Text(
                qrCodeResult,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                String barcodeScanRes;
                try {
                  barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                      '#F6F6F9', 'Cancel', true, ScanMode.DEFAULT);
                } on PlatformException {
                  barcodeScanRes = 'Failed to get platform version,';
                }
                setState(() {
                  qrCodeResult = barcodeScanRes;
                });
              },
              child: Text(
                "Open Scanner",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            )
          ],
        ),
      ),
    );
  }
}
