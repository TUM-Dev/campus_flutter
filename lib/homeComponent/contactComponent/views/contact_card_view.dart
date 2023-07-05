import 'package:campus_flutter/base/extensions/base_64_decode_image_data.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/string_parser.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_loading_view.dart';
import 'package:campus_flutter/personDetailedComponent/model/person_details.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/person_details_viewmodel.dart';
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
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: studentCard?.image != null
                  ? Image.memory(base64DecodeImageData(studentCard!.image)).image
                  : const AssetImage('assets/images/Portrait_Placeholder.png'),
              backgroundColor: Theme.of(context).cardTheme.color,
              radius: 50,
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    data != null
                        ? data.fullName
                        : PersonDetailsViewModel
                        .defaultPersonDetails.fullName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall),
                Text(ref.watch(profileDetailsViewModel).profile != null
                    ? ref.watch(profileDetailsViewModel).profile?.tumID ?? "xy00abc"
                    : "xy00abc"),
                Text(data != null
                    ? data.email
                    : PersonDetailsViewModel.defaultPersonDetails.email),
                for (var studyProgram in studies?.sublist(0, studies.length >= 2 ? 2 : studies.length) ?? []) ...[
                  Text("${studyProgram.name} (${StringParser.degreeShort(studyProgram.degree)})")
                ]
              ],
            )
          ],
        ));
  }
}
