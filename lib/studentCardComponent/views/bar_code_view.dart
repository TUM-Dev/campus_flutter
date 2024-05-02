import 'package:barcode_widget/barcode_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class BarCodeView extends StatelessWidget {
  final String libraryID;

  const BarCodeView({super.key, required this.libraryID});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(context.localizations.libraryBarcode),
        initiallyExpanded: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding),
            child: Container(
              color: Colors.white,
              child: BarcodeWidget(
                height: 70,
                padding: EdgeInsets.all(context.halfPadding),
                data: libraryID,
                barcode: Barcode.code39(),
                drawText: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.halfPadding),
            child: Text(
              "${context.localizations.libraryNumber}: $libraryID",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
