import 'package:campus_flutter/base/extensions/base64+decodeImageData.dart';
import 'package:campus_flutter/homeComponent/contactComponent/contactCardLoadingView.dart';
import 'package:campus_flutter/personDetailedComponent/model/personDetails.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/personDetailsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactCardView extends StatefulWidget {
  const ContactCardView({super.key});

  @override
  State<StatefulWidget> createState() => _ContactCardViewState();
}

class _ContactCardViewState extends State<ContactCardView> {
  late PersonDetailsViewModel personDetailsViewModel;

  @override
  void initState() {
    personDetailsViewModel =
        Provider.of<PersonDetailsViewModel>(context, listen: false);
    personDetailsViewModel.fetchPersonDetails();
    super.initState();
  }

  @override
  build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<PersonDetailsViewModel>(context, listen: true)
            .personDetails
            .stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return contactInfo(snapshot.data);
          } else {
            return const ContactCardLoadingView();
          }
        });
  }

  Widget contactInfo(PersonDetails? data) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: data != null ? Image.memory(base64DecodeImageData(data.imageData)).image :
                  const AssetImage('assets/images/Portrait_Placeholder.png'),
                  radius: 50,
                ),
                const Padding(padding: EdgeInsets.only(left: 16)),
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
                    Text(personDetailsViewModel.profile != null
                        ? personDetailsViewModel.profile?.tumID ?? "xy00abc"
                        : "xy00abc"),
                    Text(data != null
                        ? data.email
                        : PersonDetailsViewModel.defaultPersonDetails.email),
                    // TODO: solve with tumCard api
                    const Text("Wirtschaftsinformatik B.Sc.")
                  ],
                )
              ],
            )));
  }
}
