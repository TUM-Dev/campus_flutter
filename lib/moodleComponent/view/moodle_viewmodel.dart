import 'package:campus_flutter/base/networking/protocols/api.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_course.dart';
import 'package:campus_flutter/moodleComponent/model/moodle_user.dart';
import 'package:campus_flutter/moodleComponent/networking/apis/MoodleApi.dart';
import 'package:campus_flutter/moodleComponent/service/shibboleth_session_generator.dart';
import 'package:campus_flutter/onboardingComponent/viewModels/onboarding_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MoodleViewModel extends ConsumerStatefulWidget {
  const MoodleViewModel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _MoodleViewModelState();

}

class _MoodleViewModelState extends ConsumerState<MoodleViewModel> {

  MoodleApi? api;
  ShibbolethSession? session;
  late Future<void> _future;
  var moodleCourses = <MoodleCourse>[];

  @override
  void initState() {
    super.initState();
    _future = connectToMoodle();
  }

  Future<void> connectToMoodle() async {
    var username = Api.tumId;
    var password = await ref.read(onboardingViewModel).getPassword();
    ShibbolethSession session =  await ShibbolethSessionGenerator().generateSession(username, password).timeout(Duration(seconds: 15), onTimeout: () {
      throw WrongTumPasswordSetException();
    });
    try{
    this.session = session;
    api = MoodleApi(session);
    MoodleUser user = await api!.getMoodleUser(username);
    var courses = await api!.getCourses(user);
    moodleCourses = courses;}
        catch(e) {
      throw WrongTumPasswordSetException();
        }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future, builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (snapshot.hasError) {
        if(snapshot.error is NoTumPasswordSetException) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Kein TUM Password gesetzt. Bitte setze dein Passwort in den Einstellungen."),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  context.push(
                      safetyArea
                  );

                },
                icon: const Icon(Icons.settings, size: 18),
                label: const Text('Öffnen'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async{
                  await CookieManager.instance().deleteAllCookies();
                  setState(() {
                    session =  null;
                    api = null;
                    _future = connectToMoodle();
                  });

                },
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Erneut versuchen'),
              ),
            ],
          ));
        }else if(snapshot.error is WrongTumPasswordSetException) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Das gesetzte TUM Password ist möglicherweise falsch. Bitte setze dein Passwort in den Einstellungen."),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  context.push(
                      safetyArea
                  );

                },
                icon: const Icon(Icons.settings, size: 18),
                label: const Text('Öffnen'),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Theme.of(context).colorScheme.onSecondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  await CookieManager.instance().deleteAllCookies();
                  setState(() {
                    session =  null;
                    api = null;
                    _future = connectToMoodle();
                  });

                },
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Erneut versuchen'),
              ),
            ],
          ));
        }
        debugPrintStack(stackTrace: snapshot.stackTrace);
        return Center(child: Text("Error: ${snapshot.error}"));
      } else {
       return ListView.builder(
         scrollDirection: Axis.horizontal,
          itemCount: moodleCourses.length,
          itemBuilder: (context, index) => SizedBox(
            width: 300,
            height: 200,
            child: moodleCourses[index].build(context, session: session!, api: api!)
          )
        );
      }
    });
  }
}