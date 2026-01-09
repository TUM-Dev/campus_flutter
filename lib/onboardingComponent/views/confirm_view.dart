import 'package:campus_flutter/base/enums/error_handling_view_type.dart';
import 'package:campus_flutter/base/util/custom_back_button.dart';

import 'package:campus_flutter/base/util/icon_text.dart';
import 'package:campus_flutter/base/util/url_launcher.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:campus_flutter/base/extensions/context.dart';

class ConfirmView extends ConsumerStatefulWidget {
  const ConfirmView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends ConsumerState<ConfirmView> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/token-tutorial.mp4");

  int currentText = 0;

  late List<String> texts;

  @override
  initState() {
    _videoPlayerController.initialize().then((value) {
      _videoPlayerController.addListener(setText);
      _videoPlayerController.setLooping(true);
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    texts = [
      context.tr("signInToTumOnline"),
      context.tr("selectTokenManagement"),
      context.tr("activateToken"),
    ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void setText() {
    _videoPlayerController.position.then((value) async {
      if (value != null) {
        if (value.compareTo(const Duration(seconds: 5, milliseconds: 16)) ==
                1 &&
            value.compareTo(const Duration(seconds: 9, milliseconds: 2)) ==
                -1) {
          if (mounted) {
            setState(() {
              currentText = 1;
            });
          }
        } else if (value.compareTo(
                  const Duration(seconds: 9, milliseconds: 3),
                ) ==
                1 &&
            value.compareTo(const Duration(seconds: 16, milliseconds: 24)) ==
                -1) {
          if (mounted) {
            setState(() {
              currentText = 2;
            });
          }
        } else if (value.compareTo(Duration.zero) == 1 &&
            value.compareTo(const Duration(seconds: 5, milliseconds: 16)) ==
                -1) {
          if (mounted) {
            setState(() {
              currentText = 0;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark
        ? Theme.of(context).canvasColor
        : Colors.white;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: backgroundColor,
        title: Text(context.tr("checkToken")),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (MediaQuery.orientationOf(context) == Orientation.portrait) {
      return _portraitBody();
    } else {
      return _landscapeBody();
    }
  }

  Widget _portraitBody() {
    return Column(
      children: [
        _hintText(),
        const Spacer(),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: AspectRatio(
            aspectRatio: 0.46,
            child: VideoPlayer(_videoPlayerController),
          ),
        ),
        const Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_tumOnlineButton(), _checkTokenButton(context)],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        _contactSupportButton(),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _landscapeBody() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.25,
                child: AspectRatio(
                  aspectRatio: 0.46,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.padding),
                child: _hintText(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.halfPadding),
                child: _tumOnlineButton(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.halfPadding),
                child: _checkTokenButton(context),
              ),
              _contactSupportButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _hintText() {
    return Text(texts[currentText], textAlign: TextAlign.center);
  }

  Widget _tumOnlineButton() {
    return ElevatedButton(
      onPressed: () => UrlLauncher.urlString("https://campus.tum.de", ref),
      child: const SymbolText.icon(
        iconData: Icons.language,
        label: "TUMOnline",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _checkTokenButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ref
            .read(onboardingViewModel)
            .confirmLogin()
            .then(
              (value) {
                if (value.confirmed) {
                  if (context.mounted) {
                    context.push(permissionCheck);
                  }
                } else {
                  throw TumOnlineApiException(
                    tumOnlineApiExceptionType:
                        TumOnlineApiExceptionTokenNotConfirmed(),
                  );
                }
              },
              onError: (error) {
                if (context.mounted) {
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 10),
                      content: ErrorHandlingRouter(
                        error: error,
                        errorHandlingViewType: ErrorHandlingViewType.textOnly,
                        titleColor: Colors.white,
                      ),
                    ),
                  );
                }
              },
            )
            .catchError((error) {
              if (context.mounted) {
                ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 10),
                    content: ErrorHandlingRouter(
                      error: error,
                      errorHandlingViewType: ErrorHandlingViewType.textOnly,
                      titleColor: Colors.white,
                    ),
                  ),
                );
              }
            });
      },
      child: SymbolText.icon(
        iconData: Icons.arrow_forward,
        label: context.tr("checkToken"),
        style: const TextStyle(color: Colors.white),
        leadingIcon: false,
      ),
    );
  }

  Widget _contactSupportButton() {
    return Center(
      child: MaterialButton(
        onPressed: () => context.push(feedback),
        child: Text(
          context.tr("contactSupport"),
          style: TextStyle(color: context.primaryColor),
        ),
      ),
    );
  }
}
