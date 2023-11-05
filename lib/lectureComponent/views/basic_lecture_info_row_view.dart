import 'package:flutter/material.dart';

class BasicLectureInfoRowView extends StatelessWidget {
  const BasicLectureInfoRowView({
    super.key,
    required this.information,
    required this.iconData,
    this.trailingWidget,
  });

  final String information;
  final IconData iconData;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(iconData, size: 20),
      title: Text(information),
      trailing: trailingWidget,
    );
  }
}
