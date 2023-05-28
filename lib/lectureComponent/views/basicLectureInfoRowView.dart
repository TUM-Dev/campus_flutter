import 'package:flutter/material.dart';

class BasicLectureInfoRow extends StatelessWidget {
  const BasicLectureInfoRow({super.key, required this.information, required this.iconData});

  final String information;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Icon(iconData, size: 20),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
      Expanded(child: Text(information))
    ]);
  }
}