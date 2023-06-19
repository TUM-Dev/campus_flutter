import 'package:campus_flutter/base/helpers/placeholderText.dart';
import 'package:campus_flutter/base/helpers/shimmerView.dart';
import 'package:flutter/material.dart';

class ContactCardLoadingView extends StatelessWidget {
  const ContactCardLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Portrait_Placeholder.png'),
              radius: 50,
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerView(
                    child: PlaceholderText(
                  text: "Max Mustermann",
                  style: Theme.of(context).textTheme.headlineSmall,
                )),
                const ShimmerView(child: PlaceholderText(text: "go43hum")),
                const ShimmerView(child: PlaceholderText(text: "max.mustermann@tum.de")),
                const ShimmerView(child: PlaceholderText(text: "Informatik B.Sc.")),
              ],
            )
          ],
        ));
  }
}