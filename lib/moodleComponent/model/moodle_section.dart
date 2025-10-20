// --- Supporting Class: MoodleCourseDetails ---
import 'package:flutter/cupertino.dart';

class MoodleCourseDetails {
  final String id;
  final int numSections;
  final List<String> sectionList;
  final bool editMode;
  final String highlighted;
  final String maxSections;
  final String baseurl;
  final String stateKey;
  final String maxBytes;
  final String maxBytesText;

  MoodleCourseDetails({
    required this.id,
    required this.numSections,
    required this.sectionList,
    required this.editMode,
    required this.highlighted,
    required this.maxSections,
    required this.baseurl,
    required this.stateKey,
    required this.maxBytes,
    required this.maxBytesText,
  });

  factory MoodleCourseDetails.fromJson(Map<String, dynamic> json) {
    return MoodleCourseDetails(
      id: json['id'] as String,
      numSections: int.parse(json['numsections'].toString()), // JSON field is string, but should be int
      sectionList: List<String>.from(json['sectionlist'] as List),
      editMode: json['editmode'] as bool,
      highlighted: json['highlighted'] as String,
      maxSections: json['maxsections'] as String,
      baseurl: json['baseurl'] as String,
      stateKey: json['statekey'] as String,
      maxBytes: json['maxbytes'] as String,
      maxBytesText: json['maxbytestext'] as String,
    );
  }
}

// --- Supporting Class: MoodleSection ---
class MoodleSection {

  final List<String> monthNamesDe = [
    'Januar', 'Februar', 'März', 'April', 'Mai', 'Juni',
    'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember'
  ];
  final List<String> monthNamesEn = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final String id;
  final int section;
  final int number;
  final String title;
  final bool hasSummary;
  final String? rawTitle;
  final List<String> cmList;
  final bool visible;
  final String sectionUrl;
  final bool current;
  final bool indexCollapsed;
  final bool contentCollapsed;
  final bool hasRestrictions;
  final bool bulkEditable;
  final String? component;
  final String? itemId;
  final String? parentSectionId;

  MoodleSection({
    required this.id,
    required this.section,
    required this.number,
    required this.title,
    required this.hasSummary,
    this.rawTitle,
    required this.cmList,
    required this.visible,
    required this.sectionUrl,
    required this.current,
    required this.indexCollapsed,
    required this.contentCollapsed,
    required this.hasRestrictions,
    required this.bulkEditable,
    this.component,
    this.itemId,
    this.parentSectionId,
  });

  bool isCurrentlyRelevant() {
    if(!title.contains("-")) {
      return false;
    }
    var splitTitle = title.split("-");
    try {
      String startString = splitTitle[0].trim();
      String endString = splitTitle[1].trim();
      for (int i = 0; i < monthNamesDe.length; i++) {
        startString = startString.replaceAll(monthNamesDe[i], (i + 1).toString().padLeft(2, '0'));
        endString = endString.replaceAll(monthNamesDe[i], (i + 1).toString().padLeft(2, '0'));
        startString = startString.replaceAll(monthNamesEn[i], (i + 1).toString().padLeft(2, '0'));
        endString = endString.replaceAll(monthNamesEn[i], (i + 1).toString().padLeft(2, '0'));
      }
      startString = "${startString.replaceAll(" ", "")}.${DateTime.now().year}".replaceAll(".", "-");
      endString = "${endString.replaceAll(" ", "")}.${DateTime.now().year}".replaceAll(".", "-");
      var startParts = startString.split("-");
      startString = "${startParts[2]}-${startParts[1]}-${startParts[0]}";
      var endParts = endString.split("-");
      endString = "${endParts[2]}-${endParts[1]}-${endParts[0]}";
      debugPrint("Parsed  Date String: $startString, $endString for title: $title");
      DateTime parsedStartDate = DateTime.parse(startString);
      DateTime parsedEndDate = DateTime.parse(endString);
      return (parsedStartDate.isBefore(DateTime.now()) && parsedEndDate.isAfter(DateTime.now()));
    } catch (e) {
      return false;
    }
  }

  factory MoodleSection.fromJson(Map<String, dynamic> json) {
    return MoodleSection(
      id: json['id'] as String,
      section: json['section'] as int,
      number: json['number'] as int,
      title: json['title'] as String,
      hasSummary: json['hassummary'] as bool,
      rawTitle: json['rawtitle'] as String?,
      cmList: List<String>.from(json['cmlist'] as List),
      visible: json['visible'] as bool,
      sectionUrl: json['sectionurl'] as String,
      current: json['current'] as bool,
      indexCollapsed: json['indexcollapsed'] as bool,
      contentCollapsed: json['contentcollapsed'] as bool,
      hasRestrictions: json['hasrestrictions'] as bool,
      bulkEditable: json['bulkeditable'] as bool,
      component: json['component'] as String?,
      itemId: json['itemid'] as String?,
      parentSectionId: json['parentsectionid'] as String?,
    );
  }
}

// --- Supporting Class: MoodleCm (Course Module) ---
class MoodleCm {
  final String id;
  final String anchor;
  final String name;
  final bool visible;
  final bool stealth;
  final String sectionId;
  final int sectionNumber;
  final bool userVisible;
  final bool hasCmRestrictions;
  final String modname;
  final int indent;
  final int groupMode;
  final String module;
  final String plugin;
  final bool hasDelegatedSection;
  final bool accessVisible;
  final String? url;
  final bool isTrackedUser;
  final bool allowStealth;

  MoodleCm({
    required this.id,
    required this.anchor,
    required this.name,
    required this.visible,
    required this.stealth,
    required this.sectionId,
    required this.sectionNumber,
    required this.userVisible,
    required this.hasCmRestrictions,
    required this.modname,
    required this.indent,
    required this.groupMode,
    required this.module,
    required this.plugin,
    required this.hasDelegatedSection,
    required this.accessVisible,
    this.url,
    required this.isTrackedUser,
    required this.allowStealth,
  });

  factory MoodleCm.fromJson(Map<String, dynamic> json) {
    return MoodleCm(
      id: json['id'] as String,
      anchor: json['anchor'] as String,
      name: json['name'] as String,
      visible: json['visible'] as bool,
      stealth: json['stealth'] as bool,
      sectionId: json['sectionid'] as String,
      sectionNumber: json['sectionnumber'] as int,
      userVisible: json['uservisible'] as bool,
      hasCmRestrictions: json['hascmrestrictions'] as bool,
      modname: json['modname'] as String,
      indent: json['indent'] as int,
      groupMode: int.parse(json['groupmode'].toString()), // groupmode can be string
      module: json['module'] as String,
      plugin: json['plugin'] as String,
      hasDelegatedSection: json['hasdelegatedsection'] as bool,
      accessVisible: json['accessvisible'] as bool,
      url: json['url'] as String?,
      isTrackedUser: json['istrackeduser'] as bool,
      allowStealth: json['allowstealth'] as bool,
    );
  }
}

// ===============================================
// --- Hauptklasse: MoodleCourseState ---
// ===============================================
class MoodleCourseState {
  final MoodleCourseDetails course;
  final List<MoodleSection> section;
  final List<MoodleCm> cm;

  MoodleCourseState({
    required this.course,
    required this.section,
    required this.cm,
  });

  factory MoodleCourseState.fromJson(Map<String, dynamic> json) {
    final MoodleCourseDetails course = MoodleCourseDetails.fromJson(json['course'] as Map<String, dynamic>);

    final List<dynamic> sectionJson = json['section'] as List<dynamic>;
    final List<MoodleSection> section = sectionJson
        .map((s) => MoodleSection.fromJson(s as Map<String, dynamic>))
        .toList();

    final List<dynamic> cmJson = json['cm'] as List<dynamic>;
    final List<MoodleCm> cm = cmJson
        .map((c) => MoodleCm.fromJson(c as Map<String, dynamic>))
        .toList();

    return MoodleCourseState(
      course: course,
      section: section,
      cm: cm,
    );
  }
}