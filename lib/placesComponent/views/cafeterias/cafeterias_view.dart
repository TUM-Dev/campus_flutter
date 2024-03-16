import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/views/seperated_list.dart';
import 'package:campus_flutter/homeComponent/widgetComponent/views/widget_frame_view.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeterias_viewmodel.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/cafeteria_row_view.dart';
import 'package:campus_flutter/placesComponent/views/map_widget.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CafeteriasScaffold extends StatelessWidget {
  const CafeteriasScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(context.localizations.cafeterias),
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
          return OrientationBuilder(
            builder: (context, orientation) {
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
                          bottom: context.padding,
                        ),
                        markers:
                            ref.read(cafeteriasViewModel).mapMakers(context),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: _cafeteriaList(cafeterias, false),
                      ),
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MapWidget.horizontalPadding(
                        markers:
                            ref.read(cafeteriasViewModel).mapMakers(context),
                      ),
                      const PaddedDivider(),
                      _cafeteriaList(cafeterias, true),
                    ],
                  ),
                );
              }
            },
          );
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retry: ref.read(cafeteriasViewModel).fetch,
          );
        } else {
          return DelayedLoadingIndicator(
            name: context.localizations.cafeterias,
          );
        }
      },
    );
  }

  Widget _cafeteriaList(List<Cafeteria> cafeterias, bool portrait) {
    return WidgetFrameView(
      title: portrait ? context.localizations.cafeterias : null,
      child: Card(
        child: SeparatedList.list(
          data: cafeterias,
          tile: (cafeteria) => CafeteriaRowView(cafeteria: cafeteria),
        ),
      ),
    );
  }
}
