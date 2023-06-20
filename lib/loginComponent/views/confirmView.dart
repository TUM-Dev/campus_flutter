import 'package:campus_flutter/base/helpers/iconText.dart';
import 'package:campus_flutter/loginComponent/viewModels/loginViewModel.dart';
import 'package:campus_flutter/providers_get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

class ConfirmView extends ConsumerStatefulWidget {
  const ConfirmView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends ConsumerState<ConfirmView> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/token-tutorial.mp4");

  @override
  void initState() {
    _videoPlayerController.addListener(() {
      setState(() {});
    });
    _videoPlayerController.initialize().then((value) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: const BackButton(), backgroundColor: Colors.white, title: Text("Check Token")),
        body: Column(children: [
          //VideoPlayer(_videoPlayerController),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
                onPressed: () {},
                child: const IconText(
                    iconData: Icons.language,
                    label: "TUMOnline",
                    style: TextStyle(color: Colors.white))),
            ElevatedButton(
                onPressed: () {
                  ref.read(loginViewModel).confirmLogin().then((value) => Navigator.of(context).popUntil((route) => route.isFirst));
                },
                  /*Provider.of<LoginViewModel>(context, listen: false)
                      .confirmLogin()
                      .then((value) => {
                            Navigator.of(context).popUntil((route) => route.isFirst)
                            //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Navigation()))
                          });*/
                //},
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
                    // TODO:
                  },
                  child: Text("Contact Support",
                      style: TextStyle(color: Theme.of(context).primaryColor)))),
          const Spacer()
        ]));
  }
}
