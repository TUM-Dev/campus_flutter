import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/networking/base/grpc_client.dart';
import 'package:campus_flutter/main.dart';

class StudentClubService {
  static Future<(DateTime?, List<StudentClubCollection>)> fetchStudentClubs(
    Language? language,
    bool forceRefresh,
  ) async {
    final start = DateTime.now();
    GrpcClient grpcClient = getIt<GrpcClient>();
    final response = await grpcClient.listStudentClub(
      ListStudentClubRequest(
        language: language,
      ),
    );
    return (start, response.collections);
  }
}
