import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: context.halfPadding)),
        Expanded(child: Text(info)),
      ],
    );
  }
}
