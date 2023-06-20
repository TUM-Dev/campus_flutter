import 'package:campus_flutter/base/extensions/base64+decodeImageData.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contactCardLoadingView.dart';
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
  build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(profileDetailsViewModel).personDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return contactInfo(snapshot.data);
          } else {
            return const DelayedLoadingIndicator(
              alternativeLoadingIndicator: ContactCardLoadingView(),
              delayWidget: SizedBox.expand(),
            );
          }
        });
  }

  Widget contactInfo(PersonDetails? data) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: data?.imageData != null
                      ? Image.memory(base64DecodeImageData(data!.imageData!)).image
                      : const AssetImage('assets/images/portrait_placeholder.png'),
                  backgroundColor: Colors.white,
                  radius: 50,
                ),
                const Padding(padding: EdgeInsets.only(left: 15)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    // TODO: solve with tumCard api?
                    const Text("coming soon")
                  ],
                )
              ],
            )));
  }
}
