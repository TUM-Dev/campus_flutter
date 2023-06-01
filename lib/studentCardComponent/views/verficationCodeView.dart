import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: ExpansionTile(
        title: const Text("Verification QR-Code"),
        children: [
          BarcodeWidget(
              data: "https://www.tum.app",
              barcode: Barcode.qrCode(),
              drawText: false,
              height: 150
          ),
          const Text("currently for demo reasons only")
        ]));
  }
}
