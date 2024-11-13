import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/student_club.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class StudentClubCardView extends ConsumerWidget {
  const StudentClubCardView({
    super.key,
    required this.studentClub,
  });

  final StudentClub studentClub;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => UrlLauncher.urlString(studentClub.linkUrl, ref),
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          if (studentClub.coverUrl.contains("svg"))
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: SvgPicture.network(
                  studentClub.coverUrl,
                  fit: BoxFit.cover,
                  placeholderBuilder: (context) => Image.asset(
                    "assets/images/placeholders/student_club_placeholder.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          if (!studentClub.coverUrl.contains("svg"))
            Expanded(
              flex: 4,
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  color: Colors.white,
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                imageUrl: studentClub.coverUrl,
                fit: BoxFit.cover,
                errorWidget: (context, _, __) => Image.asset(
                  "assets/images/placeholders/student_club_placeholder.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Divider(height: 0),
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  studentClub.parsedName,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
