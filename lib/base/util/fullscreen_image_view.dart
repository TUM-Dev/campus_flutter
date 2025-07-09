import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';
import 'package:campus_flutter/navigaTumComponent/model/navigatum_roomfinder_map.dart';
import 'package:campus_flutter/base/extensions/context.dart';
import 'package:flutter/material.dart';

class ImageFullScreenScaffold extends StatelessWidget {
  factory ImageFullScreenScaffold.network({
    required String url,
    NavigaTumRoomFinderMap? map,
  }) {
    return ImageFullScreenScaffold(url: url, map: map);
  }

  factory ImageFullScreenScaffold.imageData({
    required String imageData,
    NavigaTumRoomFinderMap? map,
  }) {
    return ImageFullScreenScaffold(imageData: imageData, map: map);
  }

  const ImageFullScreenScaffold({
    super.key,
    this.url,
    this.imageData,
    this.map,
  });

  final String? url;
  final String? imageData;
  final NavigaTumRoomFinderMap? map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const CustomBackButton(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: ImageFullScreenView(map: map, url: url, imageData: imageData),
    );
  }
}

class ImageFullScreenView extends StatefulWidget {
  const ImageFullScreenView({super.key, this.map, this.url, this.imageData});

  final String? url;
  final String? imageData;
  final NavigaTumRoomFinderMap? map;

  @override
  State<ImageFullScreenView> createState() => _ImageFullScreenViewState();
}

class _ImageFullScreenViewState extends State<ImageFullScreenView> {
  /// needed for zoom and pan
  Offset viewState = Offset.zero;
  double scale = 1.0;
  double initialScale = 1.0;

  /// animation of blinking map point
  bool isRed = false;
  double radius = 7.5;
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    if (widget.map != null) {
      timer = repeatTimer();
    }
  }

  @override
  void dispose() {
    if (widget.map != null) {
      timer.cancel();
    }
    super.dispose();
  }

  Timer repeatTimer() {
    return Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        isRed = !isRed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          scale = 1.0;
          viewState = Offset.zero;
        });
      },
      onScaleStart: (details) {
        initialScale = scale;
      },
      onScaleUpdate: (details) {
        final scale = initialScale * details.scale;
        if (scale >= 0.5 && scale <= 5) {
          setState(() {
            viewState += details.focalPointDelta / this.scale;
            if (scale >= 0.5 && scale <= 3) {
              this.scale = scale;
            }
          });
        }
      },
      child: Transform.scale(
        scale: scale,
        child: Transform.translate(
          offset: viewState,
          child: Stack(
            children: [
              if (widget.url != null)
                CachedNetworkImage(
                  imageUrl: widget.url!,
                  fit: getBoxFit(),
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                ),
              if (widget.imageData != null)
                Image.asset(
                  widget.imageData!,
                  fit: getBoxFit(),
                  alignment: Alignment.center,
                ),
              if (widget.map != null)
                Positioned(
                  left: _calculateX(
                    MediaQuery.sizeOf(context).height,
                    MediaQuery.sizeOf(context).width,
                    widget.map!,
                  ),
                  top: _calculateY(
                    MediaQuery.sizeOf(context).height,
                    MediaQuery.sizeOf(context).width,
                    widget.map!,
                  ),
                  child: CircleAvatar(
                    radius: radius,
                    backgroundColor: isRed
                        ? Colors.redAccent
                        : context.theme.primaryColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  BoxFit getBoxFit() {
    if (MediaQuery.orientationOf(context) == Orientation.landscape) {
      return BoxFit.fitHeight;
    } else {
      return BoxFit.fitWidth;
    }
  }

  double _calculateY(double height, double width, NavigaTumRoomFinderMap map) {
    if (MediaQuery.orientationOf(context) == Orientation.landscape) {
      return _calculateYLandscape(height, map);
    } else {
      return _calculateYPortrait(height, width, map);
    }
  }

  double _calculateX(double height, double width, NavigaTumRoomFinderMap map) {
    if (MediaQuery.orientationOf(context) == Orientation.landscape) {
      return _calculateXLandscape(height, width, map);
    } else {
      return _calculateXPortrait(width, map);
    }
  }

  double _calculateYLandscape(double height, NavigaTumRoomFinderMap map) {
    final scaleFactor = ((height - kToolbarHeight) / map.height);
    return scaleFactor * map.y - (radius * 2);
  }

  double _calculateYPortrait(
    double height,
    double width,
    NavigaTumRoomFinderMap map,
  ) {
    final scaleFactor = (width / map.width);
    final actualHeight = scaleFactor * map.height;
    final heightUpperSpace = (height - actualHeight) / 2;
    return (scaleFactor * map.y) +
        heightUpperSpace -
        kToolbarHeight -
        _getMinusRadius();
  }

  double _calculateXLandscape(
    double height,
    double width,
    NavigaTumRoomFinderMap map,
  ) {
    final scaleFactor = ((height - kToolbarHeight) / map.height);
    final actualWidth = scaleFactor * map.width;
    final widthLeftSpace = (width - actualWidth) / 2;
    return (scaleFactor * map.x) + widthLeftSpace - (radius * 2);
  }

  double _calculateXPortrait(double width, NavigaTumRoomFinderMap map) {
    final scaleFactor = (width / map.width);
    return scaleFactor * map.x - radius;
  }

  double _getMinusRadius() {
    if (Platform.isIOS) {
      return radius;
    } else {
      return 0;
    }
  }
}
