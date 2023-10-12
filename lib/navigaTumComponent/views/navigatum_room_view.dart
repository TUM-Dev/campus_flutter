import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_details_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_details_view.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_building_view.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_maps_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:campus_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigaTumRoomScaffold extends StatelessWidget {
  const NavigaTumRoomScaffold({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(context.localizations.roomDetails),
      ),
      body: SafeArea(
          child: NavigaTumRoomView(
        id: id,
      )),
    );
  }
}

class NavigaTumRoomView extends ConsumerStatefulWidget {
  const NavigaTumRoomView({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavigaTumRoomState();
}

class _NavigaTumRoomState extends ConsumerState<NavigaTumRoomView> {
  late Provider<NavigaTumDetailsViewModel> viewModel;

  @override
  void initState() {
    viewModel = navigaTumDetailsViewModel(widget.id);
    ref.read(viewModel).fetchDetails(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(viewModel).details,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _name(snapshot.data!.name),
                  _type(snapshot.data!.typeCommonName),
                  NavigaTumRoomDetailsView(
                    id: snapshot.data!.id,
                    properties: snapshot.data!.additionalProperties.properties,
                  ),
                  NavigaTumRoomBuildingView(
                      coordinates: snapshot.data!.coordinates),
                  NavigaTumRoomMapsView(maps: ref.read(viewModel).getMaps())
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry:
                  ref.read(navigaTumDetailsViewModel(widget.id)).fetchDetails,
            );
          } else {
            return const DelayedLoadingIndicator(
              name: "Room Details",
            );
          }
        });
  }

  Widget _name(String name) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _type(String type) {
    return Padding(
        padding: EdgeInsets.only(
            left: context.padding,
            right: context.padding,
            bottom: context.padding),
        child: Text(type));
  }
}
