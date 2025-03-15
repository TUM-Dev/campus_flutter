import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/icon_text.dart' show IconText;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CampusMapLegend extends StatelessWidget {
  const CampusMapLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.canvasColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          if (context.theme.brightness == Brightness.light)
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              offset: Offset(0, 2),
            ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(context.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconText(
              iconData: Icons.place,
              label: context.tr("cafeterias"),
              iconColor: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.halfPadding),
            ),
            IconText(
              iconData: Icons.place,
              label: context.tr("studyRooms"),
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
