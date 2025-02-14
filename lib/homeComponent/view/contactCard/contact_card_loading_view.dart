import 'package:campus_flutter/base/enums/device.dart';
import 'package:campus_flutter/base/services/device_type_service.dart';
import 'package:campus_flutter/base/util/placeholder_text.dart';
import 'package:campus_flutter/base/util/shimmer_view.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_card_view.dart';
import 'package:flutter/material.dart';

class ContactCardLoadingView extends StatelessWidget {
  const ContactCardLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const SizedBox(width: contactImageSize, height: contactImageSize),
          const Padding(padding: EdgeInsets.only(left: 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (DeviceService.getType(context) == Device.phone)
                ShimmerView(
                  child: PlaceholderText(
                    text: "StudentCard".toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ShimmerView(
                child: PlaceholderText(
                  text: "Max Mustermann",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const ShimmerView(
                child: PlaceholderText(text: "max.mustermann@tum.de"),
              ),
              const ShimmerView(child: PlaceholderText(text: "go42tum")),
            ],
          ),
        ],
      ),
    );
  }
}
