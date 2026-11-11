import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/campusComponent/model/student_club.dart';
import 'package:campus_flutter/campusComponent/view/studentClub/student_club_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StudentClubCardView extends StatelessWidget {
  const StudentClubCardView({super.key, required this.studentClub});

  final StudentClub studentClub;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: studentClub.hasDetails
          ? InkWell(
              onTap: () => showStudentClubSheet(context, studentClub),
              child: body(context),
            )
          : body(context),
    );
  }

  static const coverHeight = 96.0;
  static const _linkIconSize = 16.0;

  /// Fits the cover, two name lines and the link line.
  static double heightFor(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final scaler = MediaQuery.textScalerOf(context);
    return coverHeight +
        1 +
        24 +
        (scaler.scale(text.bodyMedium?.fontSize ?? 14) * 1.4 * 2).ceil() +
        4 +
        math.max(
          _linkIconSize,
          (scaler.scale(text.labelMedium?.fontSize ?? 12) * 1.35)
              .ceilToDouble(),
        );
  }

  Widget body(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final placeholder = ColoredBox(
      color: Color.alphaBlend(
        colors.onSurface.withValues(alpha: 0.08),
        colors.surface,
      ),
      child: Center(
        child: Icon(
          Icons.groups_outlined,
          size: 32,
          color: colors.onSurfaceVariant,
        ),
      ),
    );
    final url = studentClub.coverUrl;
    final isSvg =
        Uri.tryParse(url)?.path.toLowerCase().endsWith('.svg') ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: coverHeight,
          child: url.trim().isEmpty
              ? placeholder
              : ColoredBox(
                  color: Colors.white,
                  child: isSvg
                      ? SvgPicture.network(
                          url,
                          fit: BoxFit.contain,
                          imageBuilder: (context, child) => Padding(
                            padding: const EdgeInsets.all(12),
                            child: child,
                          ),
                          errorBuilder: (context, error, stack) => placeholder,
                          placeholderBuilder: (context) => placeholder,
                        )
                      : CachedNetworkImage(
                          imageUrl: url,
                          imageBuilder: (context, imageProvider) => Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                          placeholder: (context, _) => placeholder,
                          errorWidget: (context, _, _) => placeholder,
                        ),
                ),
        ),
        const Divider(height: 1),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  studentClub.parsedName,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500, height: 1.4),
                ),
                if (studentClub.hasLink) ...[
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.link,
                        size: _linkIconSize,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          studentClub.linkDomain,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: colors.primary, height: 1.35),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
