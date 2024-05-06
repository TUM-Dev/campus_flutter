import 'package:campus_flutter/base/enums/credentials.dart';
import 'package:campus_flutter/base/util/card_with_padding.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_error_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/link_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/tuition_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_unauthorized_view.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/viewModel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
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
              child: CardWithPadding(
                child: Center(
                  child: _body(snapshot),
                ),
              ),
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
        return const ContactCardErrorView();
      } else {
        return Container();
      }
    }
  }
}
