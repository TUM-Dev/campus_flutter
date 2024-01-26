import 'package:campus_flutter/base/enums/error_handling_view_type.dart';

import 'package:campus_flutter/base/helpers/icon_text.dart';
import 'package:campus_flutter/base/helpers/url_launcher.dart';
import 'package:campus_flutter/base/networking/apis/tumOnlineApi/tum_online_api_exception.dart';
import 'package:campus_flutter/base/errorHandling/error_handling_router.dart';
import 'package:campus_flutter/feedbackComponent/views/feedback_form_view.dart';
import 'package:campus_flutter/loginComponent/viewModels/login_viewmodel.dart';
import 'package:campus_flutter/loginComponent/views/permission_check_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      context.localizations.signInToTumOnline,
      context.localizations.selectTokenManagement,
      context.localizations.activateToken,
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
    final backgroundColor =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? Theme.of(context).canvasColor
            : Colors.white;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: backgroundColor,
        title: Text(context.localizations.checkToken),
      ),
      body: Column(
        children: [
          Text(texts[currentText], textAlign: TextAlign.center),
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
            children: [
              ElevatedButton(
                onPressed: () =>
                    UrlLauncher.urlString("https://campus.tum.de", ref),
                child: const IconText(
                  iconData: Icons.language,
                  label: "TUMOnline",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(loginViewModel).confirmLogin().then(
                    (value) {
                      if (value.confirmed) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PermissionCheckView(),
                          ),
                        );
                      } else {
                        throw TumOnlineApiException(
                          tumOnlineApiExceptionType:
                              TumOnlineApiExceptionTokenNotConfirmed(),
                        );
                      }
                    },
                    onError: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 10),
                          content: ErrorHandlingRouter(
                            error: error,
                            errorHandlingViewType:
                                ErrorHandlingViewType.textOnly,
                            titleColor: Colors.white,
                          ),
                        ),
                      );
                    },
                  ).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 10),
                        content: ErrorHandlingRouter(
                          error: error,
                          errorHandlingViewType: ErrorHandlingViewType.textOnly,
                          titleColor: Colors.white,
                        ),
                      ),
                    );
                  });
                },
                child: IconText(
                  iconData: Icons.arrow_forward,
                  label: context.localizations.checkToken,
                  style: const TextStyle(color: Colors.white),
                  leadingIcon: false,
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Center(
            child: MaterialButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedbackFormScaffold(),
                ),
              ),
              child: Text(
                context.localizations.contactSupport,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
