import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApi.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumCabeApi/tumCabeApiService.dart';
import 'package:campus_flutter/base/networking/apis/tumDevAppApi/tumDevAppApi.dart';
import 'package:campus_flutter/base/networking/apis/tumDevAppApi/tumDevAppApiError.dart';
import 'package:campus_flutter/base/networking/apis/tumDevAppApi/tumDevAppApiService.dart';
import 'package:campus_flutter/base/networking/protocols/mainApi.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomData.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/studyRoomImageMapping.dart';
import 'package:get/get.dart';

class StudyRoomsService {
  static Future<StudyRoomData> fetchStudyRooms() async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<StudyRoomData, TumDevAppApi, TumDevAppApiError>(
        TumDevAppApi(tumDevAppService: TumDevAppServiceRooms()),
        StudyRoomData.fromJson,
        TumDevAppApiError.fromJson,
        false
    );

    return response.data;
  }

  static Future<StudyRoomImageMapping> fetchMap(String room) async {
    MainApi mainApi = Get.find();
    final response = await mainApi.makeRequest<StudyRoomImageMapping, TumCabeApi, TumCabeApiError>(
        TumCabeApi(tumCabeService: TumCabeServiceRoomMaps(room: room)),
        StudyRoomImageMapping.fromJson,
        TumCabeApiError.fromJson,
        false
    );

    return response.data;
  }
}