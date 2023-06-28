import 'package:campus_flutter/base/extensions/base64+decodeImageData.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_loading_view.dart';
import 'package:campus_flutter/personDetailedComponent/model/personDetails.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/personDetailsViewModel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactCardView extends ConsumerStatefulWidget {
  const ContactCardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactCardViewState();
}

class _ContactCardViewState extends ConsumerState<ContactCardView> {
  @override
  void initState() {
    ref.read(studentCardViewModel);
    super.initState();
  }

  @override
  build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(profileDetailsViewModel).personDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return contactInfo(snapshot.data);
          } else {
            return DelayedLoadingIndicator(
              alternativeLoadingIndicator: const ContactCardLoadingView(),
              delayWidget: Container(),
            );
          }
        });
  }

  Widget contactInfo(PersonDetails? data) {
    final studentCard = ref.read(studentCardViewModel).studentCard.value;
    final studies = studentCard?.studies?.study;
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: studentCard?.image != null
              ? Image.memory(base64DecodeImageData(studentCard!.image)).image
              : const AssetImage('assets/images/placeholders/portrait_placeholder.png'),
          backgroundColor: Colors.white,
          radius: 50,
        ),
        const Padding(padding: EdgeInsets.only(left: 15)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                data != null
                    ? data.fullName
                    : PersonDetailsViewModel.defaultPersonDetails.fullName,
                style: Theme.of(context).textTheme.headlineSmall),
            Text(ref.watch(profileDetailsViewModel).profile != null
                ? ref.watch(profileDetailsViewModel).profile?.tumID ?? "go42tum"
                : "go42tum"),
    Text(data != null
    ? data.email
    : PersonDetailsViewModel.defaultPersonDetails.email),
    for (var studyProgram in studies?.sublist(0, studies.length >= 2 ? 2 : studies.length) ?? []) ...[
    Text("${StringParser.degreeShort(studyProgram.degree)} ${studyProgram.name}")
    ]
          ],
        ))
      ],
    );
  }
}
