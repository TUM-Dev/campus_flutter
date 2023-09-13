import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/helpers/padded_divider.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_row_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CafeteriasScaffold extends StatelessWidget {
  const CafeteriasScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Cafeterias"),
      ),
      body: const CafeteriasView(),
    );
  }
}

class CafeteriasView extends ConsumerStatefulWidget {
  const CafeteriasView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CafeteriasState();
}

class _CafeteriasState extends ConsumerState<CafeteriasView> {
  @override
  void initState() {
    ref.read(cafeteriasViewModel).fetch(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(cafeteriasViewModel).campusCafeterias,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cafeterias = ref.read(cafeteriasViewModel).cafeterias;
            return OrientationBuilder(builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MapWidget.customPadding(
                          padding: EdgeInsets.only(
                              left: context.padding,
                              right: context.padding,
                              top: context.halfPadding,
                              bottom: context.padding),
                          markers:
                              ref.read(studyRoomsViewModel).mapMakers(context)),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: _cafeteriaList(cafeterias, false),
                    ))
                  ],
                );
              } else {
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    MapWidget.horizontalPadding(
                      markers: ref.read(studyRoomsViewModel).mapMakers(context),
                    ),
                    const PaddedDivider(),
                    _cafeteriaList(cafeterias, true)
                  ],
                ));
              }
            });
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref.read(studyRoomsViewModel).fetch,
            );
          } else {
            return const DelayedLoadingIndicator(
              name: "Cafeteria",
            );
          }
        });
  }

  Widget _cafeteriaList(List<Cafeteria> cafeterias, bool portrait) {
    return WidgetFrameView(
        title: portrait ? "Study Rooms" : null,
        child: Card(
            child: SeparatedList(
                padded: true,
                data: cafeterias,
                tile: (cafeteria) => CafeteriaRowView(cafeteria: cafeteria))));
  }
}
