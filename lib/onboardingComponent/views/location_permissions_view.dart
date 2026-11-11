import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:campus_flutter/onboardingComponent/views/permission_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionView extends ConsumerStatefulWidget {
  const LocationPermissionView({super.key});

  @override
  ConsumerState<LocationPermissionView> createState() =>
      _LocationPermissionViewState();
}

class _LocationPermissionViewState extends ConsumerState<LocationPermissionView>
    with WidgetsBindingObserver {
  LocationPermission? _permission;
  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_isBusy) {
      _checkPermission();
    }
  }

  Future<void> _checkPermission() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (!mounted) return;
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        ref.read(onboardingViewModel).finishOnboarding(ref, context);
      } else {
        setState(() => _permission = permission);
      }
    } catch (_) {
      // Keep onboarding available even if the platform check fails.
      if (mounted) {
        setState(() => _permission = LocationPermission.unableToDetermine);
      }
    }
  }

  Future<void> _requestPermission() async {
    if (_isBusy) return;
    setState(() => _isBusy = true);
    try {
      if (_permission == LocationPermission.deniedForever) {
        final opened = await Geolocator.openAppSettings();
        if (!opened) throw StateError('Could not open settings');
      } else {
        await ref.read(onboardingViewModel).requestLocation(ref, context);
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('locationPermissionError'))),
        );
      }
    } finally {
      if (mounted) setState(() => _isBusy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_permission == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    final needsSettings = _permission == LocationPermission.deniedForever;
    return PermissionView(
      imagePath: 'assets/images/location.png',
      title: context.tr('locationOnboardingTitle'),
      description: context.tr(
        needsSettings ? 'locationOnboardingSettings' : 'locationOnboarding',
      ),
      buttonLabel: context.tr(
        needsSettings ? 'locationOpenSettings' : 'locationEnable',
      ),
      hint: context.tr('locationOptional'),
      skipLabel: context.tr('locationNotNow'),
      isBusy: _isBusy,
      onButtonPress: _requestPermission,
      onSkip: () =>
          ref.read(onboardingViewModel).finishOnboarding(ref, context),
    );
  }
}
