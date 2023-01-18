import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Qrscanner extends StatefulWidget {
  const Qrscanner({super.key});

  @override
  State<Qrscanner> createState() => _QrscannerState();
}

class _QrscannerState extends State<Qrscanner> {
  void parseUri() {
    url = Uri.parse(barcode);
  }

  static String barcode = '';
  Uri url = Uri.parse(barcode);

  scanQR() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#000000', 'Cancel', true, ScanMode.BARCODE)
        .then(
      (value) => setState(
        () {
          barcode = value;
          parseUri();
        },
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Silakan Scan QR dibawah ini!!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset(
                  "img/qr.jpg",
                ),
              ),
              ElevatedButton(
                  onPressed: () => scanQR(), child: Text('Start QR scan')),
              TextButton(
                  onPressed: () {
                    _launchUrl();
                  },
                  child: Text(barcode))
            ]));
  }
}
