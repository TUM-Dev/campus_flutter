import 'package:campus_flutter/base/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedbackSuccessView extends StatelessWidget {
  const FeedbackSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Image(
              image: AssetImage("assets/images/tower.png"),
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.padding * 2),
            child: Text(
              context.tr("successfullySent"),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(context.tr("back")),
          ),
        ],
      ),
    );
  }
}
