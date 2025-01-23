import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/studiesComponent/view/grade/grades_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(context.tr("grades")),
      ),
      body: GradesView(),
    );
  }
}
