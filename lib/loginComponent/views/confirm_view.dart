import 'dart:io';

import 'package:campus_flutter/base/helpers/iconText.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/views/error_handling_view.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class ConfirmView extends ConsumerStatefulWidget {
  const ConfirmView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends ConsumerState<ConfirmView> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/token-tutorial.mp4");

  int currentText = 0;

  List<String> texts = const [
    "1. Sign in to TumOnline\n",
    "2. Select Token-Management\n",
    "3. Activate the newly created token \nand enable your desired permissions"
  ];

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
          setState(() {
            currentText = 1;
          });
        } else if (value
                    .compareTo(const Duration(seconds: 9, milliseconds: 3)) ==
                1 &&
            value.compareTo(const Duration(seconds: 16, milliseconds: 24)) ==
                -1) {
          setState(() {
            currentText = 2;
          });
        } else if (value.compareTo(Duration.zero) == 1 &&
            value.compareTo(const Duration(seconds: 5, milliseconds: 16)) ==
                -1) {
          setState(() {
            currentText = 0;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: const BackButton(),
            backgroundColor: Colors.white,
            title: const Text("Check Token")),
        body: Column(children: [
          Text(texts[currentText], textAlign: TextAlign.center),
          const Spacer(),
          SizedBox(
              height: 500,
              width: 230,
              child: VideoPlayer(_videoPlayerController)),
          const Spacer(flex: 2),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () async {
                  final url = Uri.parse("https://campus.tum.de");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: const IconText(
                    iconData: Icons.language,
                    label: "TUMOnline",
                    style: TextStyle(color: Colors.white))),
            ElevatedButton(
                onPressed: () {
                  ref.read(loginViewModel).confirmLogin().then(
                      (value) {
                        if (value.confirmed) {
                          Navigator
                              .of(context)
                              .popUntil((route) => route.isFirst);
                        } else {
                          throw TumOnlineApiException(tumOnlineApiExceptionType: TumOnlineApiExceptionTokenNotConfirmed());
                        }
                      },
                      onError: (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 10),
                                  content: ErrorHandlingView(error: error, errorHandlingViewType: ErrorHandlingViewType.textOnly, titleColor: Colors.white,)));
                      }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            duration: const Duration(seconds: 10),
                            content: ErrorHandlingView(error: error, errorHandlingViewType: ErrorHandlingViewType.textOnly, titleColor: Colors.white)));
                  });
                },
                child: const IconText(
                  iconData: Icons.arrow_forward,
                  label: "Check Token",
                  style: TextStyle(color: Colors.white),
                  leadingIcon: false,
                )),
          ]),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Center(
              child: MaterialButton(
                  onPressed: () async {
                    final info = await PackageInfo.fromPlatform();
                    final operatingSystem = Platform.operatingSystem;
                    final osVersion = Platform.operatingSystemVersion;

                    final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: "app@tum.de",
                        queryParameters: {
                          "subject": "[$operatingSystem - Token]",
                          "body": "Hello, I have an issue activating the token of Campus Online in the TCA version ${info.version} with build number ${info.buildNumber} on $osVersion. Please describe the problem in more detail."
                        });

                    if (await canLaunchUrl(emailUri)) {
                      await launchUrl(emailUri);
                    }
                  },
                  child: Text("Contact Support",
                      style:
                          TextStyle(color: Theme.of(context).primaryColor)))),
          const Spacer(flex: 2)
        ]));
  }
}
