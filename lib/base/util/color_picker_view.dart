import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerView extends StatefulWidget {
  const ColorPickerView({
    super.key,
    required this.color,
    required this.onColorChanged,
  });

  final Color? color;
  final Function(Color)? onColorChanged;

  @override
  State<StatefulWidget> createState() => _ColorPickerViewState();
}

class _ColorPickerViewState extends State<ColorPickerView> {
  late Color selectedColor;

  @override
  void didChangeDependencies() {
    selectedColor = widget.color ?? context.primaryColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              titlePadding: const EdgeInsets.all(0),
              contentPadding: const EdgeInsets.all(0),
              content: SingleChildScrollView(
                child: HueRingPicker(
                  pickerColor: selectedColor,
                  onColorChanged: (color) {
                    setState(() {
                      selectedColor = color;
                    });
                    if (widget.onColorChanged != null) {
                      widget.onColorChanged!(color);
                    }
                  },
                ),
              ),
            );
          },
        );
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: selectedColor,
          shape: BoxShape.circle,
          border: Border.all(
            color:
                (() {
                  final luminance = selectedColor.computeLuminance();
                  if (luminance >= 0.5) {
                    return Theme.of(context).brightness == Brightness.light
                        ? Colors.grey
                        : selectedColor;
                  } else {
                    return Theme.of(context).brightness == Brightness.light
                        ? selectedColor
                        : Colors.white;
                  }
                })(),
            width: 1,
          ),
        ),
      ),
    );
  }
}
