
import 'dart:convert';

import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_section.dart';
import 'package:campus_flutter/moodleComponent/networking/apis/MoodleApi.dart';
import 'package:campus_flutter/moodleComponent/service/shibboleth_session_generator.dart';
import 'package:campus_flutter/moodleComponent/view/moodle_course_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:xml/xml.dart' as xml;

class MoodleCourse{
  final int id;
  final String fullname;
  final String shortname;
  final String idnumber;
  final String summary;
  final int summaryFormat;
  final int startDate;
  final int endDate;
  final bool visible;
  final bool showActivityDates;
  final bool showCompletionConditions;
  final String pdfExportFont;
  final String fullnameDisplay;
  final String viewUrl;
  final String courseImage;
  final int progress;
  final bool hasProgress;
  final bool isFavourite;
  final bool hidden;
  final int timeAccess;
  final bool showShortname;
  final String courseCategory;
  MoodleCourseState? state;
  
  MoodleCourse({
    required this.id,
    required this.fullname,
    required this.shortname,
    required this.idnumber,
    required this.summary,
    required this.summaryFormat,
    required this.startDate,
    required this.endDate,
    required this.visible,
    required this.showActivityDates,
    required this.showCompletionConditions,
    required this.pdfExportFont,
    required this.fullnameDisplay,
    required this.viewUrl,
    required this.courseImage,
    required this.progress,
    required this.hasProgress,
    required this.isFavourite,
    required this.hidden,
    required this.timeAccess,
    required this.showShortname,
    required this.courseCategory,
  });

  Future<void> fetchState(MoodleApi api) async {
    state = await api.getCourseStateForCourse(this);
  }



  Widget createImage() {
    if (courseImage.isEmpty) {
      return const Icon(Icons.book, size: 40);
    } else {
     if(courseImage.contains("base64")) {
        //base64 image
        final base64String = courseImage.split(',').last;
        var converted = utf8.decode(base64.decode(base64String));
        converted = converted.replaceAll("100%", "280px");
       return SvgPicture.string(
         converted,
         width: 250,
         height: 250,
         fit: BoxFit.cover,
         placeholderBuilder: (context) => const Icon(Icons.book, size: 40),
       );

      } else {
        return Image.network(
          courseImage,
          width: 250,
          height: 250,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.book, size: 40);
          },
        );
     }
    }
  }
  
  //to and from json
  factory MoodleCourse.fromJson(Map<String, dynamic> json) {
    return MoodleCourse(
      id: json['id'],
      fullname: json['fullname'],
      shortname: json['shortname'],
      idnumber: json['idnumber'],
      summary: json['summary'],
      summaryFormat: json['summaryformat'],
      startDate: json['startdate'],
      endDate: json['enddate'],
      visible: json['visible'],
      showActivityDates: json['showactivitydates'],
      showCompletionConditions: json['showcompletionconditions']??false,
      pdfExportFont: json['pdfexportfont'],
      fullnameDisplay: json['fullnamedisplay'],
      viewUrl: json['viewurl'],
      courseImage: json['courseimage'],
      progress: json['progress'],
      hasProgress: json['hasprogress'],
      isFavourite: json['isfavourite'],
      hidden: json['hidden'],
      timeAccess: json['timeaccess'],
      showShortname: json['showshortname'],
      courseCategory: json['coursecategory'],
    );
  }

  //to string
  @override
  String toString() {
    return 'MoodleCourse{id: $id, fullname: $fullname}';
  }

  Widget build(BuildContext context, {bool withArrowForward = true, bool withArrowBackward = false, ShibbolethSession? session, MoodleApi? api}) {

    //create a smooth design
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.8,
        width: MediaQuery.of(context).size.width * 0.25,
        child:
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () {
            if (withArrowForward) {
              final arguments = MoodleCourseArguments(
                session: session!,
                api: api!,
                course: this,
              );

              context.push("$moodle/viewCourse", extra: arguments);
            }else if(withArrowBackward) {
              context.pop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  fullname,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                createImage(),
                const SizedBox(height: 10),
                Text(
                  courseCategory,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                withArrowForward ? Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.primary): withArrowBackward ? Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary): const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ));
  }
}
