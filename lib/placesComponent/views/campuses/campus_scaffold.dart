import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/base/providers/default_campus_provider.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/map_launcher.dart';
import 'package:campus_flutter/placesComponent/views/campuses/campus_view.dart';
import 'package:campus_flutter/settingsComponent/views/default_campus_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class CampusScaffold extends ConsumerStatefulWidget {
  const CampusScaffold({super.key, required this.campus});

  final Campus campus;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CampusScaffoldState();
}

class _CampusScaffoldState extends ConsumerState<CampusScaffold> {
  final _height = 200.0;
  final _fraction = 3 / 4;

  @override
  Widget build(BuildContext context) {
    final fractionalHeight = _height * _fraction;
    final label = defaultCampusLabel(context, widget.campus);
    final isDefault = ref.watch(defaultCampusProvider) == widget.campus;

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(label),
        titleSpacing: 0,
        actions: [
          IconButton(
            tooltip: context.tr('defaultCampus'),
            onPressed: () {
              ref
                  .read(defaultCampusProvider.notifier)
                  .select(isDefault ? null : widget.campus);
            },
            icon: Icon(
              isDefault ? Icons.push_pin : Icons.push_pin_outlined,
              color: context.theme.primaryColor,
            ),
          ),
          IconButton(
            tooltip: context.tr('showDirections'),
            onPressed: () =>
                showDirectionsDialog(label, widget.campus.location, context),
            icon: Icon(
              Icons.directions_outlined,
              color: context.theme.primaryColor,
            ),
          ),
          if (MediaQuery.orientationOf(context) == Orientation.portrait)
            IconButton(
              tooltip: context.tr('map'),
              onPressed: () => context.push(campusMap, extra: widget.campus),
              icon: Icon(Icons.map_outlined, color: context.theme.primaryColor),
            ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return CustomScrollView(
              slivers: [
                SliverLayoutBuilder(
                  builder: (context, constraints) {
                    final progress = constraints.scrollOffset > fractionalHeight
                        ? (constraints.scrollOffset - fractionalHeight) /
                              (_height - 0 - fractionalHeight)
                        : 0.0;
                    return SliverAppBar(
                      expandedHeight: _height,
                      toolbarHeight: 0,
                      collapsedHeight: 0,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Opacity(
                          opacity: progress <= 1 ? 1 - progress : 0,
                          child: Image.asset(
                            widget.campus.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        centerTitle: true,
                        expandedTitleScale: 1,
                      ),
                    );
                  },
                ),
                AdaptedCampusView(
                  campus: widget.campus,
                  orientation: orientation,
                ),
              ],
            );
          } else {
            return CampusView(campus: widget.campus, orientation: orientation);
          }
        },
      ),
    );
  }
}
