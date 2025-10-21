import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/util/padded_divider.dart';
import 'package:campus_flutter/homeComponent/view/contactCard/contact_view.dart';
import 'package:campus_flutter/homeComponent/view/widget/widget_screen.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_course.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_user.dart';
import 'package:campus_flutter/moodleComponent/networking/apis/MoodleApi.dart';
import 'package:campus_flutter/moodleComponent/service/shibboleth_session_generator.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<List<MoodleCourse>> connectToMoodle(WidgetRef ref) async {
  var username = Api.tumId;
  var password = await ref.read(onboardingViewModel).getPassword();
  ShibbolethSession session =  await ShibbolethSessionGenerator().generateSession(username, password).timeout(Duration(seconds: 15), onTimeout: () {
    throw WrongTumPasswordSetException();
  });
  try {
    var api = MoodleApi(session);
    MoodleUser user = await api.getMoodleUser(username);
    Api.courses =  await api.getCourses(user);
    Api.session = session;
    Api.moodleApi = api;
    return Api.courses;
  }
  catch(e) {
    throw WrongTumPasswordSetException();
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _widgetScrollView();
        } else {
         return SizedBox(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           child: Row(children: [
           Expanded(child: ContactScreen()),
             const VerticalDivider(width: 0),
             Expanded(child: SingleChildScrollView(
               controller: scrollController,
               scrollDirection: Axis.vertical,
               child: WidgetScreen(),)), ]
         ));
        }
      },
    );
  }

  Widget _widgetScrollView() {
    return SingleChildScrollView(
      controller: scrollController,
      child: const Column(
        children: [ContactScreen(), PaddedDivider(), WidgetScreen()],
      ),
    );
  }
}
