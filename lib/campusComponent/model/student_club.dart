import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:html/parser.dart';

extension ParsedStudentClub on StudentClub {
  String get parsedName => parseFragment(name).text ?? name;

  String get parsedDescription =>
      (parseFragment(description).text ?? description).trim();

  bool get hasParsedDescription => parsedDescription.isNotEmpty;

  bool get hasLink => linkUrl.trim().isNotEmpty;

  String get linkDomain {
    final url = linkUrl.trim();
    final host = Uri.tryParse(url)?.host ?? '';
    if (host.isEmpty) return url;
    return host.startsWith('www.') ? host.substring(4) : host;
  }

  bool get hasDetails => hasParsedDescription || hasLink;
}
