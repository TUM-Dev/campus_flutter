import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/link_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/tuition_view.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/unauthorized_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(profileViewModel).profile,
        builder: (context, snapshot) {
          return Column(children: [
            SizedBox(
                height: 125,
                child: Card(
                    child: Center(
                        child: snapshot.hasData
                            ? const ContactCardView()
                            : snapshot.hasError
                                ? const UnauthorizedView()
                                : const SizedBox.expand()))),
            const TuitionView(),
            const LinkView()
          ]);
        });
  }
}
