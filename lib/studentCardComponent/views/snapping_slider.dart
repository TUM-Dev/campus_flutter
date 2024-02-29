import 'package:barcode_widget/barcode_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:flutter/material.dart';

class SnappingSlider extends StatefulWidget {
  const SnappingSlider({super.key, required this.libraryID});

  final String libraryID;

  @override
  State<SnappingSlider> createState() => _SnappingSliderState();
}

class _SnappingSliderState extends State<SnappingSlider> {
  final int _numPages = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _numPages,
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  itemCount: _numPages,
                  itemBuilder: (BuildContext context, int index) {
                    return CardWithPadding(
                      child: index == 1
                          ? _barcodeView(context)
                          : _verificationView(context),
                    );
                  },
                  onPageChanged: (index) {
                    DefaultTabController.of(context).index = index;
                  },
                ),
              ),
              const TabPageSelector(indicatorSize: 8.0),
            ],
          );
        },
      ),
    );
  }

  Widget _verificationView(BuildContext context) {
    return Column(
      children: [
        Text(
          "Verification QR-Code",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        BarcodeWidget(
          data: "https://www.tum.app",
          barcode: Barcode.qrCode(),
          color: Theme.of(context).colorScheme.onSurface,
          drawText: false,
          height: 150,
        ),
        const Text("demo purposes only"),
        const Spacer(),
      ],
    );
  }

  Widget _barcodeView(BuildContext context) {
    return Column(
      children: [
        Text(
          context.localizations.libraryBarcode,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        BarcodeWidget(
          data: widget.libraryID,
          barcode: Barcode.code39(),
          drawText: false,
          color: Theme.of(context).colorScheme.onSurface,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          height: 100,
        ),
        Text("${context.localizations.libraryNumber}: ${widget.libraryID}"),
        const Spacer(),
      ],
    );
  }
}
