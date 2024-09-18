import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:html/parser.dart';

extension ParsedStudentClub on StudentClub {
  String get parsedName => parseFragment(name).text ?? name;
}