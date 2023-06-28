import 'package:campus_flutter/base/networking/apis/tumDevAppApi/tumDevAppApiService.dart';
import 'package:campus_flutter/base/networking/protocols/api.dart';

// TODO: figure out errors
class TumDevAppApi extends Api {

  final TumDevAppService tumDevAppService;

  TumDevAppApi({required this.tumDevAppService});

  @override
  String get baseURL => "www.devapp.it.tum.de";

  @override
  bool get needsAuth => false;

  @override
  Map<String, String> get parameters => tumDevAppService.getParameters();

  @override
  String get path => "";

  @override
  String get paths => "iris/ris_api.php";
}