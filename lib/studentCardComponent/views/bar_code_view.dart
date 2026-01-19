import 'package:barcode_widget/barcode_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BarCodeView extends StatelessWidget {
  final String libraryID;

  const BarCodeView({super.key, required this.libraryID});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(context.tr("libraryBarcode")),
        initiallyExpanded: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: BarcodeWidget(
                height: 70,
                padding: const EdgeInsets.all(10),
                data: libraryID,
                barcode: Barcode.code128(),
                drawText: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.halfPadding),
            child: Text(
              "${context.tr("libraryNumber")}: $libraryID",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
