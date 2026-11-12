import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/networking/apis/tumdev/campus_backend.pb.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/campusComponent/model/student_club.dart';
import 'package:material_ui/material_ui.dart';
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

  static const coverHeight = 96.0;

  static double heightFor(BuildContext context) {
    final fontSize = Theme.of(context).textTheme.bodyMedium?.fontSize ?? 14;
    return coverHeight +
        1 +
        24 +
        (MediaQuery.textScalerOf(context).scale(fontSize) * 1.4 * 2).ceil();
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
            child: Center(
              child: Text(
                studentClub.parsedName,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500, height: 1.4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
