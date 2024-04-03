import 'dart:developer';

import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/feedbackComponent/services/feedback_service.dart';
import 'package:campus_flutter/personDetailedComponent/viewModel/person_details_viewmodel.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

final feedbackViewModel = Provider((ref) => FeedbackViewModel(ref));

class FeedbackViewModel {
  BehaviorSubject<bool> shareLocation = BehaviorSubject.seeded(false);
  BehaviorSubject<bool> activeButton = BehaviorSubject.seeded(false);
  BehaviorSubject<bool?> validEmail = BehaviorSubject.seeded(null);
  BehaviorSubject<bool?> validMessage = BehaviorSubject.seeded(null);
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController message = TextEditingController();

  final Ref ref;

  FeedbackViewModel(this.ref);

  initForm() {
    final email = ref.read(profileDetailsViewModel).personDetails.value?.email;
    if (email != null) {
      emailAddress.text = email;
      validEmail.add(true);
    }
  }

  Future<void> sendFeedBack(BuildContext context) async {
    Position? position;
    if (shareLocation.value) {
      try {
        position = await LocationService.getLastKnown();
      } catch (_) {
        position = null;
      }
    }

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final baseInfo = await deviceInfo.deviceInfo;
    final deviceInfos =
        "${baseInfo.data["machine"] ?? baseInfo.data["model"]} - ${baseInfo.data["systemVersion"]}";

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageInfos = packageInfo.version;

    final feedback = CreateFeedbackRequest(
      recipient: CreateFeedbackRequest_Recipient.TUM_DEV,
      fromEmail: emailAddress.text,
      message: message.text,
      location: Coordinate(
        latitude: position?.latitude,
        longitude: position?.longitude,
      ),
      osVersion: deviceInfos,
      appVersion: packageInfos,
    );

    FeedbackService.sendFeedback(feedback).then(
      (value) {
        context.pushReplacement(feedbackSuccess);
      },
      onError: (error) => _errorDialog(error, context),
    );
  }

  void _errorDialog(dynamic error, BuildContext context) {
    log(error.runtimeType.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          context.localizations.unableToSend,
          textAlign: TextAlign.center,
        ),
        content: ErrorHandlingRouter(
          error: error,
          errorHandlingViewType: ErrorHandlingViewType.descriptionOnly,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => context.pop(),
            child: Text(context.localizations.back),
          ),
        ],
      ),
    );
  }

  void checkMessageValidity() {
    if (message.value.text.isNotEmpty) {
      validMessage.add(true);
    } else {
      validMessage.add(false);
    }
    checkButton();
  }

  void checkEmailValidity() {
    final RegExp validEmailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (emailAddress.value.text.isNotEmpty) {
      if (validEmailRegex.hasMatch(emailAddress.value.text)) {
        validEmail.add(true);
      } else {
        validEmail.add(false);
      }
    }
    checkButton();
  }

  void checkButton() {
    activeButton
        .add((validEmail.value ?? false) && (validMessage.value ?? false));
  }

  void clearForm() {
    emailAddress.text = "";
    message.text = "";
    shareLocation.add(false);
    activeButton.add(false);
    validMessage.add(null);
    validEmail.add(null);
  }
}
