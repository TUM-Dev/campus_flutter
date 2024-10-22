import 'package:campus_flutter/base/networking/apis/irisApi/iris_api.dart';
import 'package:campus_flutter/base/networking/apis/irisApi/iris_api_endpoint.dart';
import 'package:campus_flutter/base/networking/base/rest_client.dart';
import 'package:campus_flutter/placesComponent/model/studyRooms/study_room_data.dart';
import 'package:campus_flutter/main.dart';

class StudyRoomsService {
  static Future<(DateTime?, StudyRoomData)> fetchStudyRooms(
    bool forcedRefresh,
  ) async {
    RestClient restClient = getIt<RestClient>();
    final response = await restClient.get<StudyRoomData, IrisApi>(
      IrisApi(irisApiEndpoint: IrisApiEndpointRooms()),
      StudyRoomData.fromJson,
      forcedRefresh,
    );

    return (response.saved, response.data);
  }
}
