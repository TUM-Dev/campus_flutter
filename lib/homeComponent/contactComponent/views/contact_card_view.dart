import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_flutter/base/extensions/base_64_decode_image_data.dart';
import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/homeComponent/contactComponent/views/contact_card_loading_view.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:campus_flutter/personDetailedComponent/model/person_details.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/profileComponent/model/profile.dart';
import 'package:campus_flutter/profileComponent/viewModel/profile_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class ContactCardView extends ConsumerStatefulWidget {
  const ContactCardView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContactCardViewState();
}

class _ContactCardViewState extends ConsumerState<ContactCardView> {
  @override
  void initState() {
    ref.read(profileDetailsViewModel).fetch(false);
    ref.read(studentCardViewModel);
    super.initState();
  }

  @override
  build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(profileDetailsViewModel).personDetails,
      builder: (context, snapshot) {
        if (snapshot.hasData || snapshot.hasError) {
          return InkWell(
            onTap: () => NavigationService.openStudentCardSheet(context),
            child: contactInfo(
              snapshot.data,
              ref.read(profileViewModel).profile.value!,
            ),
          );
        } else {
          return DelayedLoadingIndicator(
            name: context.localizations.personalData,
            alternativeLoadingIndicator: const ContactCardLoadingView(),
            delayWidget: Container(),
          );
        }
      },
    );
  }

  Widget contactInfo(PersonDetails? data, Profile profile) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: data?.imageData != null
                ? Image.memory(base64DecodeImageData(data!.imageData!)).image
                : const AssetImage(
                    'assets/images/placeholders/portrait_placeholder.png',
                  ),
            backgroundColor: Theme.of(context).cardTheme.color,
            radius: 50,
          ),
          const Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data?.fullName ?? profile.fullName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  profile.tumID ?? "go42tum",
                ),
                if (data != null)
                  AutoSizeText(
                    data.email,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
