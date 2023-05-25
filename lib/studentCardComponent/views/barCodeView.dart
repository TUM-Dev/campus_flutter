import 'package:barcode_widget/barcode_widget.dart';
import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:flutter/material.dart';

class BarCodeView extends StatelessWidget {
  final String libraryID;

  const BarCodeView({super.key, required this.libraryID});

  @override
  Widget build(BuildContext context) {
    return CardWithPadding(
        child: BarcodeWidget(
            height: 75,
            width: MediaQuery.of(context).size.width,
            data: libraryID,
            barcode: Barcode.code39()
        )
    );
  }
}
