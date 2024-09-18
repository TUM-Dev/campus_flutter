import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:html/parser.dart';

extension ParsedStudentClubCollection on StudentClubCollection {
  String get parsedTitle => parseFragment(title).text ?? title;
}