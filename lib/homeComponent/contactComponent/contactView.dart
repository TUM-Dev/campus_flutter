import 'package:campus_flutter/homeComponent/contactComponent/contactCardLoadingView.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/personDetailsViewModel.dart';
import 'package:campus_flutter/profileComponent/viewModel/profileViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contactCardView.dart';
import 'linkView.dart';
import 'tuitionView.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  initState() {
    Provider.of<ProfileViewModel>(context, listen: false).fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
        Provider.of<ProfileViewModel>(context, listen: true).profile.stream,
        builder: (context, snapshot) {
          return Column(children: [
            snapshot.hasData ?
            Provider(
                create: (context) =>
                    PersonDetailsViewModel(snapshot.data),
                child: const ContactCardView())
                : const ContactCardLoadingView(),
            const TuitionView(),
            const LinkView()
          ]);
        });
  }
}
