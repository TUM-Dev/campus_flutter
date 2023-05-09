import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<StatefulWidget> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .colorScheme
              .secondaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                  AssetImage('assets/images/Portrait_Placeholder.png'),
                  radius: 50,
                ),
                const Padding(padding: EdgeInsets.only(left: 16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jakob Körber",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall),
                    const Text("ge35hum"),
                    const Text("jakob.koerber@tum.de"),
                    const Text("Wirtschaftsinformatik B.Sc.")
                  ],
                )
              ],
            )));
  }
}