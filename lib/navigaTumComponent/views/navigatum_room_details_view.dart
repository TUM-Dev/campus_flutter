import 'package:campus_flutter/base/util/seperated_list.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_frame_view.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_property.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_details_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigaTumRoomDetailsView extends ConsumerWidget {
  const NavigaTumRoomDetailsView({
    super.key,
    required this.id,
    required this.properties,
  });

  final String id;
  final List<NavigaTumNavigationProperty> properties;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetFrameView(
      title: context.tr("roomDetails"),
      child: Card(
        child: SeparatedList.list(
          data: properties,
          tile:
              (property) => _detail(
                ref.read(navigaTumDetailsViewModel(id)).icon(property.name),
                property.text,
                context,
              ),
        ),
      ),
    );
  }

  Widget _detail(IconData iconData, String detail, BuildContext context) {
    return ListTile(
      leading: Icon(iconData, color: context.primaryColor),
      title: Text(detail),
    );
  }
}
