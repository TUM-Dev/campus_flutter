import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
        Expanded(child: Text(info)),
      ],
    );
  }
}
