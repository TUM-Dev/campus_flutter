import 'package:campus_flutter/base/helpers/card_with_padding.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/link_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/tuition_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/unauthorized_view.dart';
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
                minHeight: MediaQuery.sizeOf(context).height * 0.15,
              ),
              child: CardWithPadding(
                child: Center(
                  child: snapshot.hasData
                      ? const ContactCardView()
                      : snapshot.hasError
                          ? const UnauthorizedView()
                          : Container(),
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
}
