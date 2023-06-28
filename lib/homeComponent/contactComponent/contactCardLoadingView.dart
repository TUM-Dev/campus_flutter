import 'package:campus_flutter/base/helpers/placeholderText.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContactCardLoadingView extends StatelessWidget {
  const ContactCardLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
      return Card(
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
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: PlaceholderText(
                            text: "Max Mustermann",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: const PlaceholderText(text: "go43hum")
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: const PlaceholderText(text: "max.mustermann@tum.de")
                      ),
                      Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: const PlaceholderText(text: "Informatik B.Sc.")
                      ),
                    ],
                  )
                ],
              )));
  }
}