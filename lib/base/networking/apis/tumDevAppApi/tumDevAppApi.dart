import 'package:campus_flutter/base/networking/apis/tumDevAppApi/tumDevAppApiService.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/networking/protocols/apiError.dart';

class TumDevAppApi extends Api {

  final TumDevAppService tumDevAppService;

  TumDevAppApi({required this.tumDevAppService});

  @override
  Map<String, String> get baseHeaders => {};

  @override
  String get baseURL => "https://www.devapp.it.tum.de/";

  @override
  // TODO: implement error
  ApiError get error => throw UnimplementedError();

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => tumDevAppService.getParameters();

  @override
  String get path => "";

  @override
  String get paths => "iris/ris_api.php";
}