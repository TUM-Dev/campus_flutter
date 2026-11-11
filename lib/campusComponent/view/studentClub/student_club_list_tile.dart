import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/student_club.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class StudentClubListTile extends StatelessWidget {
  const StudentClubListTile({super.key, required this.studentClub});

  final StudentClub studentClub;

  static const avatarSize = 48.0;
  static const _padding = 12.0;
  static const _linkIconSize = 16.0;

  static TextStyle _nameStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge!
          .copyWith(fontWeight: FontWeight.w500, height: 1.3);

  static TextStyle _descriptionStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        height: 1.35,
      );

  static TextStyle _linkStyle(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium!.copyWith(height: 1.35);

  @override
  Widget build(BuildContext context) {
    final tappable = studentClub.hasDetails;
    final content = Padding(
      padding: const EdgeInsets.all(_padding),
      child: Row(
        children: [
          StudentClubAvatar(studentClub: studentClub, size: avatarSize),
          const SizedBox(width: _padding),
          Expanded(child: _text(context)),
          if (tappable) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ],
      ),
    );
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: tappable
          ? InkWell(
              onTap: () => showStudentClubSheet(context, studentClub),
              child: content,
            )
          : content,
    );
  }

  Widget _text(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final descriptionStyle = _descriptionStyle(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          studentClub.parsedName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: _nameStyle(context),
        ),
        const SizedBox(height: 2),
        if (!studentClub.hasDetails)
          Text(
            context.tr('studentClubNoDetails'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
          )
        else ...[
          if (studentClub.hasParsedDescription)
            Text(
              studentClub.parsedDescription.replaceAll(RegExp(r'\s+'), ' '),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: descriptionStyle,
            ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                studentClub.hasLink ? Icons.link : Icons.link_off,
                size: _linkIconSize,
                color: studentClub.hasLink
                    ? colors.primary
                    : colors.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  studentClub.hasLink
                      ? studentClub.linkDomain
                      : context.tr('studentClubNoWebsite'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: _linkStyle(context).copyWith(
                    color: studentClub.hasLink
                        ? colors.primary
                        : colors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

Future<void> showStudentClubSheet(
  BuildContext context,
  StudentClub studentClub,
) => showModalBottomSheet(
  context: context,
  showDragHandle: true,
  isScrollControlled: true,
  useSafeArea: true,
  builder: (context) => StudentClubSheet(studentClub: studentClub),
);

class StudentClubSheet extends ConsumerWidget {
  const StudentClubSheet({super.key, required this.studentClub});

  final StudentClub studentClub;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final muted = theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              StudentClubAvatar(studentClub: studentClub, size: 64),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  studentClub.parsedName,
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            studentClub.hasParsedDescription
                ? studentClub.parsedDescription
                : context.tr('studentClubNoDescription'),
            style: studentClub.hasParsedDescription
                ? theme.textTheme.bodyLarge
                : muted,
          ),
          const SizedBox(height: 24),
          if (studentClub.hasLink) ...[
            FilledButton.icon(
              onPressed: () =>
                  UrlLauncher.urlString(studentClub.linkUrl.trim(), ref),
              icon: const Icon(Icons.open_in_new),
              label: Text(context.tr('openWebsite')),
            ),
            const SizedBox(height: 8),
            Text(
              studentClub.linkDomain,
              textAlign: TextAlign.center,
              style: muted,
            ),
          ] else
            Text(
              context.tr('studentClubNoWebsite'),
              textAlign: TextAlign.center,
              style: muted,
            ),
        ],
      ),
    );
  }
}

/// Club logo on white, falling back to initials on a colour derived from
/// the name when there is no cover or it fails to load.
class StudentClubAvatar extends StatelessWidget {
  const StudentClubAvatar({
    super.key,
    required this.studentClub,
    required this.size,
  });

  final StudentClub studentClub;
  final double size;

  static String initials(String name) => name
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .take(2)
      .map((word) => word.characters.first.toUpperCase())
      .join();

  static (Color, Color) colorsFor(String name, Brightness brightness) {
    var hash = 0;
    for (final unit in name.codeUnits) {
      hash = (hash * 31 + unit) & 0x7fffffff;
    }
    final hue = (hash % 360).toDouble();
    final light = brightness == Brightness.light;
    return (
      HSLColor.fromAHSL(1, hue, 0.5, light ? 0.85 : 0.3).toColor(),
      HSLColor.fromAHSL(1, hue, 0.6, light ? 0.25 : 0.9).toColor(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = studentClub.parsedName;
    final (background, foreground) = colorsFor(
      name,
      Theme.of(context).brightness,
    );
    final fallback = ColoredBox(
      color: background,
      child: Center(
        child: Text(
          initials(name),
          maxLines: 1,
          textScaler: TextScaler.noScaling,
          style: TextStyle(
            color: foreground,
            fontSize: size * 0.38,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ),
    );
    final url = studentClub.coverUrl.trim();
    final isSvg =
        Uri.tryParse(url)?.path.toLowerCase().endsWith('.svg') ?? false;
    final padding = EdgeInsets.all(size / 8);
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 4),
      child: SizedBox.square(
        dimension: size,
        child: url.isEmpty
            ? fallback
            : isSvg
            ? SvgPicture.network(
                url,
                fit: BoxFit.contain,
                imageBuilder: (context, child) => ColoredBox(
                  color: Colors.white,
                  child: Padding(padding: padding, child: child),
                ),
                errorBuilder: (context, error, stack) => fallback,
                placeholderBuilder: (context) => fallback,
              )
            : CachedNetworkImage(
                imageUrl: url,
                imageBuilder: (context, imageProvider) => ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: padding,
                    child: Image(image: imageProvider, fit: BoxFit.contain),
                  ),
                ),
                placeholder: (context, _) => fallback,
                errorWidget: (context, _, _) => fallback,
              ),
      ),
    );
  }
}
