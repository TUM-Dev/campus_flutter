import 'dart:io';

import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/helpers/hyperlink_text.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_form_view.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactView extends ConsumerWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.localizations.contactMore,
      child: Card(
        child: SeparatedList.widgets(
          widgets: [
            if (!kIsWeb)
              HyperLinkListTile(
                dense: true,
                link: _betaTester(),
                label: context.localizations.becomeABetaTester,
              ),
            HyperLinkListTile(
              dense: true,
              link: "https://github.com/TUM-Dev",
              label: context.localizations.usOnGitHub,
            ),
            const HyperLinkListTile(
              dense: true,
              link: "https://app.tum.de",
              label: "TUM Dev Website",
            ),
            HyperLinkListTile(
              dense: true,
              link: "https://www.tum.app/privacy",
              label: context.localizations.privacyPolicy,
            ),
            _licensesButton(context),
            _feedbackButton(context),
          ],
        ),
      ),
    );
  }

  String _betaTester() {
    if (Platform.isAndroid) {
      return "https://play.google.com/store/apps/details?id=de.tum.tca_flutter";
    } else {
      return "https://testflight.apple.com/join/4Ddi6f2f";
    }
  }

  Widget _feedbackButton(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        "Feedback",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FeedbackFormScaffold(),
        ),
      ),
    );
  }

  Widget _licensesButton(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        context.localizations.licenses,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: () => showLicensePage(context: context),
    );
  }
}
