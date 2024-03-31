import 'dart:async';
import 'package:campus_flutter/placesComponent/services/map_theme_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends ConsumerStatefulWidget {
  factory MapWidget.fullPadding({
    required Set<Marker> markers,
    LatLng? latLng,
    EdgeInsets? controlPadding,
    double? zoom,
    double? aspectRatio,
    bool aspectRatioNeeded = true,
    bool roundedCorners = true,
  }) {
    return MapWidget._(
      markers: markers,
      controlPadding: controlPadding,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
    );
  }

  factory MapWidget.noPadding({
    required Set<Marker> markers,
    LatLng? latLng,
    EdgeInsets? controlPadding,
    double? zoom,
    double? aspectRatio,
    bool aspectRatioNeeded = true,
    bool roundedCorners = true,
  }) {
    return MapWidget._(
      markers: markers,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      padding: EdgeInsets.zero,
      controlPadding: controlPadding,
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
    );
  }

  factory MapWidget.customPadding({
    required Set<Marker> markers,
    required EdgeInsets padding,
    EdgeInsets? controlPadding,
    LatLng? latLng,
    double? zoom,
    double? aspectRatio,
    bool aspectRatioNeeded = true,
    bool roundedCorners = true,
  }) {
    return MapWidget._(
      markers: markers,
      padding: padding,
      controlPadding: controlPadding,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
    );
  }

  const MapWidget._({
    required this.markers,
    this.latLng,
    this.zoom,
    this.aspectRatio,
    this.padding,
    this.controlPadding,
    required this.aspectRatioNeeded,
    required this.roundedCorners,
  });

  final Set<Marker> markers;
  final LatLng? latLng;
  final double? zoom;
  final double? aspectRatio;
  final bool aspectRatioNeeded;
  final bool roundedCorners;
  final EdgeInsets? padding;
  final EdgeInsets? controlPadding;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool isMapVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          EdgeInsets.only(
            left: context.padding,
            right: context.padding,
            bottom: context.padding,
            top: context.halfPadding,
          ),
      child: ClipRRect(
        borderRadius: widget.roundedCorners
            ? BorderRadius.circular(15.0)
            : BorderRadius.zero,
        child: widget.aspectRatioNeeded
            ? AspectRatio(
                aspectRatio: widget.aspectRatio ?? 1.0,
                child: _mapWidget(),
              )
            : _mapWidget(),
      ),
    );
  }

  Widget _mapWidget() {
    return AnimatedOpacity(
      curve: Curves.fastOutSlowIn,
      opacity: isMapVisible ? 1.0 : 0.01,
      duration: const Duration(milliseconds: 200),
      child: GoogleMap(
        style: Theme.of(context).brightness == Brightness.light
            ? getIt.get<MapThemeService>().lightTheme
            : getIt.get<MapThemeService>().darkTheme,
        mapType: MapType.normal,
        padding: widget.controlPadding ?? EdgeInsets.zero,
        initialCameraPosition: CameraPosition(
          target: widget.latLng ??
              const LatLng(48.26307794976663, 11.668018668778569),
          zoom: widget.zoom ?? 10,
        ),
        gestureRecognizers: {
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        },
        rotateGesturesEnabled: false,
        compassEnabled: false,
        mapToolbarEnabled: false,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: widget.markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          Future.delayed(
            const Duration(milliseconds: 250),
            () => setState(() {
              if (mounted) {
                isMapVisible = true;
              }
            }),
          );
        },
      ),
    );
  }
}
