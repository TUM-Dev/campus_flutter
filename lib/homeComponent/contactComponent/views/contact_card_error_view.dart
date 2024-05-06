import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ContactCardErrorView extends StatelessWidget {
  const ContactCardErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/placeholders/portrait_placeholder.png',
            ),
            radius: 50,
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Text(
              context.tr("profileError"),
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
