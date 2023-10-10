import 'package:campus_flutter/base/helpers/delayed_loading_indicator.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/navigatumComponent/model/navigatum_navigation_entity.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigaTumRoomScaffold extends StatelessWidget {
  const NavigaTumRoomScaffold({super.key, required this.navigationEntity});

  final NavigaTumNavigationEntity navigationEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(navigationEntity.name),
      ),
      body: SafeArea(
          child: NavigaTumRoomView(
        navigationEntity: navigationEntity,
      )),
    );
  }
}

class NavigaTumRoomView extends ConsumerStatefulWidget {
  const NavigaTumRoomView({super.key, required this.navigationEntity});

  final NavigaTumNavigationEntity navigationEntity;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavigaTumRoomState();
}

class _NavigaTumRoomState extends ConsumerState<NavigaTumRoomView> {
  @override
  void initState() {
    ref
        .read(navigaTumDetailsViewModel(widget.navigationEntity.id))
        .fetchDetails(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref
            .watch(navigaTumDetailsViewModel(widget.navigationEntity.id))
            .details,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.coordinates.longitude.toString());
          } else if (snapshot.hasError) {
            return ErrorHandlingView(
              error: snapshot.error!,
              errorHandlingViewType: ErrorHandlingViewType.fullScreen,
              retry: ref
                  .read(navigaTumDetailsViewModel(widget.navigationEntity.id))
                  .fetchDetails,
            );
          } else {
            return const DelayedLoadingIndicator(
              name: "Room Details",
            );
          }
        });
  }
}
