import 'dart:async';

import 'package:campus_flutter/base/networking/apis/tumdev/cached_client.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pbgrpc.dart';
import 'package:campus_flutter/main.dart';

class FeedbackService {
  static Future<CreateFeedbackReply> sendFeedback(
    CreateFeedbackRequest createFeedbackRequest,
  ) async {
    CachedCampusClient mainApi = getIt<CachedCampusClient>();
    return await mainApi.createFeedback(Stream.value(createFeedbackRequest));
  }
}
