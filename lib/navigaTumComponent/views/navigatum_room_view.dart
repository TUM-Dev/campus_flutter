import 'package:campus_flutter/base/classes/location.dart';
import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/base/util/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/util/directions_launcher.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_navigation_details.dart';
import 'package:campus_flutter/navigaTumComponent/viewModels/navigatum_details_viewmodel.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_details_view.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_building_view.dart';
import 'package:campus_flutter/navigaTumComponent/views/navigatum_room_maps_view.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigaTumRoomScaffold extends ConsumerWidget {
  const NavigaTumRoomScaffold({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(context.localizations.roomDetails),
        actions: [
          StreamBuilder(
            stream: ref.watch(navigaTumDetailsViewModel(id)).details,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.hasCoordinates) {
                return _directionsButton(snapshot.data!, context);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: NavigaTumRoomView(
        id: id,
      ),
    );
  }

  Widget _directionsButton(
    NavigaTumNavigationDetails details,
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () => showDirectionsDialog(
        details.name,
        Location(
          latitude: details.coordinates.latitude!,
          longitude: details.coordinates.longitude!,
        ),
        context,
      ),
      icon: Icon(
        Icons.directions,
        color: context.theme.primaryColor,
      ),
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
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => ref.read(viewModel).fetchDetails(false, context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.watch(viewModel).details,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                return _landScape(snapshot.data!);
              } else {
                return _portrait(snapshot.data!);
              }
            },
          );
        } else if (snapshot.hasError) {
          return ErrorHandlingRouter(
            error: snapshot.error!,
            errorHandlingViewType: ErrorHandlingViewType.fullScreen,
            retryWithContext:
                ref.read(navigaTumDetailsViewModel(widget.id)).fetchDetails,
          );
        } else {
          return DelayedLoadingIndicator(
            name: context.localizations.roomDetails,
          );
        }
      },
    );
  }

  Widget _landScape(NavigaTumNavigationDetails details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _name(details.name),
        _type(details.typeCommonName),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NavigaTumRoomBuildingView(
                  coordinates: details.coordinates,
                  isLandScape: true,
                ),
              ),
              Expanded(child: _portrait(details, isPortrait: false)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _portrait(
    NavigaTumNavigationDetails details, {
    bool isPortrait = true,
  }) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isPortrait) ...[
              _name(details.name),
              _type(details.typeCommonName),
            ],
            NavigaTumRoomDetailsView(
              id: details.id,
              properties: details.additionalProperties.properties,
            ),
            if (isPortrait)
              NavigaTumRoomBuildingView(coordinates: details.coordinates),
            if ((details.maps.roomfinder?.available ?? []).isNotEmpty)
              NavigaTumRoomMapsView(maps: ref.read(viewModel).getMaps()),
          ],
        ),
      ),
    );
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
        bottom: context.padding,
      ),
      child: Text(type),
    );
  }
}
