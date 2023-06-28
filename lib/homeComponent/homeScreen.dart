import 'package:campus_flutter/base/helpers/paddedDivider.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(children: [
      ContactScreen(),
      PaddedDivider(),
      WidgetScreen()
    ]));
  }
}
