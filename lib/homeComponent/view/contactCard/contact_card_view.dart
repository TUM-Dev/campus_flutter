import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_flutter/base/extensions/base_64_decode_image_data.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_card_loading_view.dart';
import 'package:campus_flutter/navigation_service.dart';
import 'package:campus_flutter/personComponent/model/personDetails/person_details.dart';
import 'package:campus_flutter/personComponent/model/profile/profile.dart';
import 'package:campus_flutter/personComponent/viewModel/person_details_viewmodel.dart';
import 'package:campus_flutter/studentCardComponent/model/student_card.dart';
import 'package:campus_flutter/studentCardComponent/viewModel/student_card_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const double contactImageSize = 100;

class ContactCardView extends ConsumerStatefulWidget {
  const ContactCardView({super.key, required this.profile});

  final Profile profile;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContactCardViewState();
}

class _ContactCardViewState extends ConsumerState<ContactCardView> {
  @override
  void initState() {
    ref.read(profileDetailsViewModel).fetch(false);
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
              widget.profile,
            ),
          );
        } else {
          return DelayedLoadingIndicator(
            name: context.tr("personalData"),
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
          profilePicture(),
          const Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "StudentCard".toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  data?.fullName ?? profile.fullName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                if (data != null)
                  AutoSizeText(
                    data.email,
                    maxLines: 1,
                  ),
                if (profile.tumID != null)
                  Text(
                    profile.tumID!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profilePicture() {
    return StreamBuilder(
      stream: ref.watch(studentCardViewModel).studentCard,
      builder: (context, snapshot) {
        if (snapshot.hasData || snapshot.hasError) {
          return CircleAvatar(
            backgroundImage: imageData(snapshot),
            backgroundColor: Theme.of(context).cardTheme.color,
            radius: contactImageSize / 2,
          );
        } else {
          return SizedBox(height: contactImageSize, width: contactImageSize);
        }
      },
    );
  }

  ImageProvider<Object> imageData(AsyncSnapshot<List<StudentCard>?> snapshot) {
    if (snapshot.hasData) {
      return Image.memory(
        base64DecodeImageData(snapshot.data!.first.image),
      ).image;
    } else {
      return const AssetImage(
        'assets/images/placeholders/portrait_placeholder.png',
      );
    }
  }
}
