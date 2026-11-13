import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_card_error_view.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_card_view.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/link_view.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/tuition_view.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_card_unauthorized_view.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/personComponent/model/profile/profile.dart';
import 'package:campus_flutter/personComponent/viewModel/profile_viewmodel.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  @override
  void initState() {
    ref.read(profileViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(profileViewModel).profile,
      builder: (context, snapshot) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height * 0.175,
              ),
              child: CardWithPadding(child: Center(child: _body(snapshot))),
            ),
            const TuitionView(),
            const LinkView(),
          ],
        );
      },
    );
  }

  Widget _body(AsyncSnapshot<Profile?> snapshot) {
    if (ref.read(onboardingViewModel).credentials.value != Credentials.tumId) {
      return const ContactCardUnauthorizedView();
    } else {
      if (snapshot.hasData) {
        return ContactCardView(profile: snapshot.data!);
      } else if (snapshot.hasError) {
        return ContactCardErrorView(
          error: snapshot.error!,
          stackTrace: snapshot.stackTrace,
          retry: () => ref.read(profileViewModel).fetch(true),
        );
      } else {
        return Container();
      }
    }
  }
}
