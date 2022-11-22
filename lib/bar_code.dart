import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Qrscanner extends StatefulWidget {
  const Qrscanner({super.key});

  @override
  State<Qrscanner> createState() => _QrscannerState();
}

class _QrscannerState extends State<Qrscanner> {
  String _scanBarcode = '';
  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcode;

    try {
      barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcode);
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => scanQR(),
                            child: Text('Start QR scan')),
                        Text('Scan Link : $_scanBarcode',
                            style: TextStyle(fontSize: 20))
                      ]));
            })));
  }
}
