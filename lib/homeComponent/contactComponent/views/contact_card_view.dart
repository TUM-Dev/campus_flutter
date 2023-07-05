import 'package:campus_flutter/base/extensions/base_64_decode_image_data.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_loading_view.dart';
import 'package:campus_flutter/personDetailedComponent/model/person_details.dart';
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
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: data?.imageData != null
              ? Image.memory(base64DecodeImageData(data!.imageData!)).image
              : const AssetImage('assets/images/placeholders/portrait_placeholder.png'),
          backgroundColor: Colors.white,
          radius: 50,
        ),
        const Padding(padding: EdgeInsets.only(left: 15)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                data != null
                    ? data.fullName
                    : PersonDetailsViewModel.defaultPersonDetails.fullName,
                style: Theme.of(context).textTheme.headlineSmall),
            Text(ref.watch(profileDetailsViewModel).profile != null
                ? ref.watch(profileDetailsViewModel).profile?.tumID ?? "go42tum"
                : "go42tum"),
            Text(data != null ? data.email : PersonDetailsViewModel.defaultPersonDetails.email),
            // TODO: solve with tumCard api?
            const Text("coming soon")
          ],
        ))
      ],
    );
  }
}
