import 'dart:developer';

import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/feedbackComponent/services/feedback_service.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';

class FeedbackViewModel {
  BehaviorSubject<bool> shareLocation = BehaviorSubject.seeded(false);
  BehaviorSubject<bool> shareDeviceInfos = BehaviorSubject.seeded(false);
  BehaviorSubject<bool> activeButton = BehaviorSubject.seeded(false);
  BehaviorSubject<bool?> validEmail = BehaviorSubject.seeded(null);
  BehaviorSubject<bool?> validMessage = BehaviorSubject.seeded(null);
  BehaviorSubject<bool?> successfullySent = BehaviorSubject.seeded(null);
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

  Future<void> sendFeedBack() async {
    Position? position;
    if (shareLocation.value) {
      position = await LocationService.getLastKnown();
    }

    String? deviceInfos;
    if (shareDeviceInfos.value) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      final baseInfo = await deviceInfo.deviceInfo;
      deviceInfos =
          "${baseInfo.data["machine"] ?? baseInfo.data["model"]} - ${baseInfo.data["systemVersion"]}";
    }

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
      (value) => successfullySent.add(true),
      onError: (error) {
        final errors = error as StateError;
        log(errors.stackTrace.toString());
        successfullySent.addError(error);
      },
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
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
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
    shareDeviceInfos.add(false);
    activeButton.add(false);
    validMessage.add(null);
    validEmail.add(null);
    successfullySent.add(null);
  }
}
