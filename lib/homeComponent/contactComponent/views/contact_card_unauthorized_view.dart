import 'package:campus_flutter/base/routing/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactCardUnauthorizedView extends StatelessWidget {
  const ContactCardUnauthorizedView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(onboarding),
      child: Padding(
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
                context.tr("notLoggedIn"),
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
