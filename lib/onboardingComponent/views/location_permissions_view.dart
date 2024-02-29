import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/onboardingComponent/views/permission_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationPermissionView extends ConsumerWidget {
  const LocationPermissionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionView(
      imagePath: "assets/images/location.png",
      title: context.localizations.location,
      description: context.localizations.locationOnboarding,
      onButtonPress: () => ref.read(onboardingViewModel).requestLocation(
            ref,
            context,
          ),
    );
  }
}
