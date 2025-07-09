import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/onboardingComponent/views/permission_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationPermissionView extends ConsumerWidget {
  const LocationPermissionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionView(
      imagePath: "assets/images/location.png",
      title: context.tr("location"),
      description: context.tr("locationOnboarding"),
      onButtonPress: () =>
          ref.read(onboardingViewModel).requestLocation(ref, context),
    );
  }
}
