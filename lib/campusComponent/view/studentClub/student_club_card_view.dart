import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/student_club.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class StudentClubCardView extends ConsumerWidget {
  const StudentClubCardView({super.key, required this.studentClub});

  final StudentClub studentClub;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => UrlLauncher.urlString(studentClub.linkUrl, ref),
        child: body(context),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (studentClub.coverUrl.contains("svg"))
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: SvgPicture.network(
                studentClub.coverUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) => Image.asset(
                  "assets/images/placeholders/student_club_placeholder.png",
                  fit: BoxFit.contain,
                ),
                placeholderBuilder: (context) => Image.asset(
                  "assets/images/placeholders/student_club_placeholder.png",
                  fit: BoxFit.contain,
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
                child: Image(image: imageProvider, fit: BoxFit.contain),
              ),
              imageUrl: studentClub.coverUrl,
              fit: BoxFit.contain,
              errorWidget: (context, _, _) => Image.asset(
                "assets/images/placeholders/student_club_placeholder.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        Divider(height: 0),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            studentClub.parsedName,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
