import 'dart:async';
import 'dart:convert';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maplibre_gl/maplibre_gl.dart' as maplibre;

const pinBase64 = "UklGRroCAABXRUJQVlA4TK0CAAAvGMAIEPfkoI0kR6rZ+wDg+cN6JJfDdn0g4biRJEWKPfie/z4y38J0l+NIkhwlZw/NCzfw3wGM0uxOw61tW1U1cSeiAUL6L4AmiNzdvuvlngRI0XgaSBgIBjts0mFFGsI5t1T0rdkwlXOO8z+ZQkBLFbvZkeL4LenhmqdUZIQ29nStgzUZ5utfRqSDkIq+xTFv+vqVEanICEMqhuPReJ5q+upbENJBMJiD49/a9MVUauKcmx0pMqKPyIhUENrxbHsvx2+x32zsMBAMJAwQEJAhIEH8IUMWpQrQkUBHUYJCcVb9QJInJHhBipDgB/UofpGQQL5QH8W3KiMf8IP6apJLdWGJ+dOM99K7wXq9WZ2ZX1y3coAbkosyaiyfkhr/SkS9o+aNcjGSj7KdYre/GOB77H7VG/1m9Aa34fP0/Hy9uoFHersXoQqJkiSbttV7nWvb1rNt+13Vs23buM++Nn521l7nRLwfiOj/BMgfvfl++hpHT9x+Nq3wv5+Jv/p4JmDsC+HnR2KGzmI7d67ffshwZdATXQfY0ZjtnMus2whw6qN5BPQuSHex7Z3AXUmfjgIdLrSpFxiXHgIbEkFuGXBXOg9Uu/DCLjiuSWC3s6WbDm6uMG4tMDgBLDNZ+4eHhw/kmYXAq35gvikftvWmHXj6EphnSjxVpgX49RZYatyq4eHh1QnTATyfA3Z5Es2LWzOcXQMM6BxQaQILDsOlSD+AdUksAb5JY0eBhqCybuC9pAfAvpyAtC3AV0maPQksCmgDrvUZvQZ6amOKpoDf8t8C9uR60rcBF6OYvmPACs984MiA4vsBWpxzNV3AE4XeA6aKXf5e4IaCp88AW9OWA8c+hGngCLAS4J+S/Yn/jpKOLngujyand54XSuV94KZSOn2CoyOp0SueKNV/9J8DAA==";
// TODO: include as file instead of this nonsense - Nathan

class MapWidget extends ConsumerStatefulWidget {
  factory MapWidget.fullPadding({
    required Set<Marker> markers,
    LatLng? latLng,
    EdgeInsets? controlPadding,
    double? zoom,
    double? aspectRatio,
    bool aspectRatioNeeded = true,
    bool roundedCorners = true,
    Widget? mapLegend,
  }) {
    return MapWidget._(
      markers: markers,
      controlPadding: controlPadding,
      latLng: latLng,
      zoom: zoom,
      aspectRatio: aspectRatio,
      aspectRatioNeeded: aspectRatioNeeded,
      roundedCorners: roundedCorners,
      mapLegend: mapLegend,
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
    Widget? mapLegend,
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
      mapLegend: mapLegend,
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
    Widget? mapLegend,
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
      mapLegend: mapLegend,
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
    this.mapLegend,
  });

  final Set<Marker> markers;
  final LatLng? latLng;
  final double? zoom;
  final double? aspectRatio;
  final bool aspectRatioNeeded;
  final bool roundedCorners;
  final EdgeInsets? padding;
  final EdgeInsets? controlPadding;
  final Widget? mapLegend;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends ConsumerState<MapWidget> {
  late final Completer<maplibre.MapLibreMapController> _controller =
      Completer<maplibre.MapLibreMapController>();

  bool isMapVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.padding ??
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
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          maplibre.MapLibreMap(
            // styleString:
            //     "https://nav.tum.de/martin/style/navigatum-basemap.json", // TODO: dark and light themes - Nathan
            // mapType: MapType.normal,
            // padding: widget.controlPadding ?? EdgeInsets.zero,
            initialCameraPosition: maplibre.CameraPosition(
              target:
                  // mapLibre and Google Maps have different latLng classes. This converts between them and also provides a default location. - Nathan
                  maplibre.LatLng(
                    widget.latLng?.latitude ?? 48.26307794976663,
                    widget.latLng?.longitude ?? 11.668018668778569,
                  ),
              zoom: widget.zoom ?? 10,
            ),
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
            rotateGesturesEnabled: false,
            compassEnabled: false,
            //mapToolbarEnabled: false, ? no apparent equivalent
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: true, // zoomControlsEnabled
            myLocationEnabled: true,
            myLocationRenderMode: maplibre.MyLocationRenderMode.compass,
            onMapCreated: (maplibre.MapLibreMapController controller) {
              _controller.complete(controller);
              // Previous 250ms mounted delay no longer needed as it is now handled by onStyleLoadedCallback
            },

            //replacement for "markers: widget.markers". I know, it's a bit longer. Sorry! - Nathan
            onStyleLoadedCallback: () => {
              _controller.future.then((controller) {
                controller.addImage("pin", base64Decode(pinBase64));

                // Aligns better with Google Maps marker behavior
                controller.symbolManager?.setIconAllowOverlap(true);
                controller.symbolManager?.setIconIgnorePlacement(true);
                controller.symbolManager?.setTextAllowOverlap(true);
                controller.symbolManager?.setTextIgnorePlacement(true);

                for (var marker in widget.markers) {
                  controller.addSymbol(
                    maplibre.SymbolOptions(
                      iconSize: 3, // Not set by Google Markers, done by eye by comparing screenshots
                      iconImage: "pin", // Theoretically this could be set based on the marker ID. But in the current app it's always the same anyway.
                      iconRotate: marker.rotation,
                      iconOffset: marker.anchor,
                      textField: marker.infoWindow.title,
                      textOffset: Offset(0, -2.5), // magic number (done by eye)
                      iconOpacity: marker.alpha,
                      geometry: maplibre.LatLng(
                        marker.position.latitude,
                        marker.position.longitude,
                      ),
                      zIndex: marker.zIndexInt,
                      draggable: marker.draggable,
                      // font handling is done by Google Maps automatically. It is not in maplibre.
                      fontNames: ["Roboto Regular"],
                      textColor: "#000000",
                      textHaloColor: "#FFFFFF",
                      textHaloWidth: 3.0, // magic number (done by eye)
                      textHaloBlur: 0,
                      textOpacity: 0, // Starts hidden (handled on tap)
                      textMaxWidth: -1, // No limit
                    ),
                  );
                }

                controller.onSymbolTapped.add((symbol) {
                  // display text on tapped symbol & remove text from other symbols
                  for (var symbol in controller.symbols) {
                    controller.updateSymbol(
                      symbol,
                      maplibre.SymbolOptions(textOpacity: 0),
                    );
                  }
                  controller.updateSymbol(
                    symbol,
                    maplibre.SymbolOptions(textOpacity: 1),
                  );
                  controller.moveCamera(maplibre.CameraUpdate.newLatLng(symbol.options.geometry ?? maplibre.LatLng(0, 0))); // something will have gone very wrong if it goes to 0,0 - Nathan
                });

                if (mounted) {
                  setState(() {
                    isMapVisible = true;
                  });
                }

                // TODO: Implement floors and other features on NavigaTUM but not here. - Nathan
              }),
            },
          ),
          if (widget.mapLegend != null)
            Padding(
              padding: EdgeInsets.all(context.padding),
              child: widget.mapLegend!,
            ),
          Positioned(
            top: 10,
            left: 10,
            child: FloatingActionButton.small(
              heroTag: "geolocation_button",
              onPressed: () {
                _controller.future.then((controller) {
                  controller.requestMyLocationLatLng().then((latlng) => {
                    controller.moveCamera(
                    maplibre.CameraUpdate.newLatLng(
                      maplibre.LatLng(
                        // Default to TUM Garching campus
                        latlng?.latitude ?? 48.26307794976663,
                        latlng?.longitude ?? 11.668018668778569,
                      ),
                    ),
                  )});
                });
              },
              backgroundColor: Colors.white,
              elevation: 2e31, 
              child: Container(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  "assets/images/map/locate.png",
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
