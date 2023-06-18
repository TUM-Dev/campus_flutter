import 'package:campus_flutter/homeComponent/contactComponent/views/contactCardLoadingView.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contactCardView.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/linkView.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/tuitionView.dart';
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
  initState() {
    //ref.read(profileViewModel).fetchProfile();
    //Provider.of<ProfileViewModel>(context, listen: false).fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(profileViewModel).profile,
        //stream: Provider.of<ProfileViewModel>(context, listen: true).profile.stream,
        builder: (context, snapshot) {
          return Column(children: [
            snapshot.hasData
                ? const ContactCardView()
                : const ContactCardLoadingView(),
            const TuitionView(),
            const LinkView()
          ]);
        });
  }
}
