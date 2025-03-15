import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ThesesScreen extends StatelessWidget {
  const ThesesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(context.tr("theses")),
      ),
      body: Text("Theses"),
    );
  }
}
