import 'package:campus_flutter/base/extensions/context.dart';
import 'package:material_ui/material_ui.dart';

class StatusMessageBanner extends StatelessWidget {
  const StatusMessageBanner({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.primaryColor,
      padding: EdgeInsets.all(context.halfPadding),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
