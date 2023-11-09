import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarCodeView extends StatelessWidget {
  final String libraryID;

  const BarCodeView({super.key, required this.libraryID});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: const Text("Library Barcode"),
        initiallyExpanded: true,
        children: [
          BarcodeWidget(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            data: libraryID,
            barcode: Barcode.code39(),
            color: Theme.of(context).colorScheme.onSurface,
            drawText: false,
          ),
          Text(
            "Library Number: $libraryID",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
