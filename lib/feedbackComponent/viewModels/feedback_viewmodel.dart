import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class FeedbackViewModel {
  BehaviorSubject<bool> shareLocation = BehaviorSubject.seeded(false);
  BehaviorSubject<bool> shareDeviceInfos = BehaviorSubject.seeded(false);
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController message = TextEditingController();

  FeedbackViewModel();

  Future<void> sendFeedBack() async {
    Position? position;
    if (shareLocation.value) {
      position = await LocationService.getLastKnown();
    }

    final feedback = CreateFeedbackRequest(
      recipient: CreateFeedbackRequest_Recipient.TUM_DEV,
      fromEmail: emailAddress.text,
      message: message.text,
      location: Coordinate(
        latitude: position?.latitude,
        longitude: position?.longitude,
      ),
    );
  }
}
