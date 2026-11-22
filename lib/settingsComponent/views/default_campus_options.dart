import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

String defaultCampusLabel(BuildContext context, Campus? campus) =>
    campus == null
    ? context.tr('campusAutomatic')
    : context.tr('campusNames.${EnumName(campus).name}');

/// Selectable list of campuses (plus "Automatic"), styled like the settings
/// cards used throughout the app.
class DefaultCampusOptions extends StatelessWidget {
  const DefaultCampusOptions({
    super.key,
    required this.selected,
    required this.onSelected,
    this.margin,
  });

  final Campus? selected;
  final ValueChanged<Campus?> onSelected;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      clipBehavior: Clip.antiAlias,
      child: SeparatedList.list(
        data: <Campus?>[null, ...Campus.values],
        tile: (campus) => ListTile(
          dense: true,
          leading: _CampusAvatar(campus: campus),
          title: Text(
            defaultCampusLabel(context, campus),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: campus == selected ? context.primaryColor : null,
              fontWeight: campus == selected ? FontWeight.w600 : null,
            ),
          ),
          trailing: campus == selected
              ? Icon(Icons.check, size: 20, color: context.primaryColor)
              : null,
          onTap: () => onSelected(campus),
        ),
      ),
    );
  }
}

class _CampusAvatar extends StatelessWidget {
  const _CampusAvatar({required this.campus});

  final Campus? campus;

  static const double _size = 32;
  static const double _radius = 8;

  @override
  Widget build(BuildContext context) {
    final primary = context.primaryColor;
    final image = campus?.image;
    if (image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Image.asset(
          image,
          width: _size,
          height: _size,
          cacheWidth: 96,
          fit: BoxFit.cover,
          excludeFromSemantics: true,
        ),
      );
    }
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Icon(
        campus == null ? Icons.near_me_outlined : Icons.apartment_outlined,
        color: primary,
        size: 18,
      ),
    );
  }
}
