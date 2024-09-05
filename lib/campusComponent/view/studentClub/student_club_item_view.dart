import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class StudentClubItemView extends ConsumerWidget {
  const StudentClubItemView({
    super.key,
    required this.studentClub,
    this.isCarousel = false,
  });

  final StudentClub studentClub;
  final bool isCarousel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isCarousel) {
      return body(context);
    } else {
      return InkWell(
        onTap: () => UrlLauncher.urlString(studentClub.linkUrl, ref),
        child: body(context),
      );
    }
  }

  Widget body(BuildContext context) {
    return Container(
      color: Theme.of(context).cardTheme.color,
      child: Column(
        children: [
          if (studentClub.coverUrl.contains("svg"))
            Expanded(
              flex: 4,
              child: SvgPicture.network(
                studentClub.coverUrl,
                fit: BoxFit.cover,
                placeholderBuilder: (context) => Image.asset(
                  "assets/images/placeholders/student_club_placeholder.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (!studentClub.coverUrl.contains("svg"))
            Expanded(
              flex: 4,
              child: CachedNetworkImage(
                imageUrl: studentClub.coverUrl,
                fit: BoxFit.cover,
                errorWidget: (context, _, __) => Image.asset(
                  "assets/images/placeholders/student_club_placeholder.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  studentClub.name,
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
