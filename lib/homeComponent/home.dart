import 'package:campus_flutter/eatComponent/eatService.dart';
import 'package:campus_flutter/eatComponent/model/mensaMenu.dart';
import 'package:campus_flutter/homeComponent/personalDetailsComponent/view/personalDetails.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            HomeHeader(),
            Divider(),
            EatSlider(),
            //MealPlanWidget()
          ],
        ),
      ),
    ));
  }
}

class EatSlider extends StatefulWidget {
  const EatSlider({super.key});

  @override
  State<StatefulWidget> createState() => _EatSliderState();
}

class _EatSliderState extends State<EatSlider> {
  late Future<MensaMenu> mensaMenu;

  @override
  void initState() {
    super.initState();
    mensaMenu = EatService.fetchTodayFood();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mensaMenu,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (var dish in snapShot.data!.dishes)
                    ...[
                      Container(width: 160, color: Colors.blue, child: Text(dish.name)),
                    const Padding(padding: EdgeInsets.only(right: 8))]
                ],
              ),
            );
          } else if (snapShot.hasError){
            return Container(
              height: 160,
              width: double.infinity,
              color: Colors.blue,
              child: const Text("no food today"),
            );
          }

          return const CircularProgressIndicator();
        }
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const PersonalDetails(),
      const SizedBox(
        height: 8,
      ),
      Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: const [
                Text("Tuition Fees"),
                Spacer(),
                Icon(Icons.check)
              ]))),
      const SizedBox(
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextButton.icon(
              onPressed: () async {
                final url = Uri.parse("https://moodle.tum.de");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              style: FilledButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(Icons.school_outlined),
              ),
              label: const Text("Moodle"),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 4.0, right: 4.0)),
          Expanded(
            child: TextButton.icon(
              onPressed: () async {
                final url = Uri.parse("https://campus.tum.de");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              style: FilledButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Padding(
                padding: EdgeInsets.all(7.0),
                child: Icon(Icons.language_outlined),
              ),
              label: const Text("TUMOnline"),
            ),
          ),
        ],
      ),
    ]);
  }
}
