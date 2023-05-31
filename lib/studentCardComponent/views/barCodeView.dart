import 'package:barcode_widget/barcode_widget.dart';
import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
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
              Text("Library Number: $libraryID", style: Theme.of(context).textTheme.labelLarge)
            ]
        )
    );
  }
}

class SnappingSlider extends StatefulWidget {
  @override
  _SnappingSliderState createState() => _SnappingSliderState();
}

class _SnappingSliderState extends State<SnappingSlider> {
  final double _minValue = 0;
  final double _maxValue = 100;
  final int _numPages = 5;
  double _sliderValue = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _numPages,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.blue, // Replace with your desired page content
              );
            },
          ),
        ),
        Slider(
          min: _minValue,
          max: _maxValue,
          value: _sliderValue,
          onChanged: (newValue) {
            setState(() {
              _sliderValue = newValue;
              int page = (_sliderValue / (_maxValue / (_numPages - 1))).round();
              _pageController.animateToPage(
                page,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
        ),
      ],
    );
  }
}
