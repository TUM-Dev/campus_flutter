import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/eatComponent/eatService.dart';
import 'package:campus_flutter/eatComponent/model/mensaMenu.dart';
import 'package:flutter/material.dart';

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
                  for (var indexAndValue in snapShot.data!.dishes.indexed) ...[
                    if (indexAndValue.$1 == 0) ...[
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5)),
                      Container(
                          width: 160,
                          color: Colors.blue,
                          child: Text(indexAndValue.$2.name))
                    ],
                    if (indexAndValue.$1 ==
                        snapShot.data!.dishes.length - 1) ...[
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5)),
                      Container(
                          width: 160,
                          color: Colors.blue,
                          child: Text(indexAndValue.$2.name)),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5))
                    ],
                    if (indexAndValue.$1 != 0 &&
                        indexAndValue.$1 !=
                            snapShot.data!.dishes.length - 1) ...[
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5)),
                      Container(
                          width: 160,
                          color: Colors.blue,
                          child: Text(indexAndValue.$2.name))
                    ]
                  ]
                ],
              ),
            );
          } else if (snapShot.hasError) {
            return Container(
              height: 160,
              width: double.infinity,
              color: Colors.blue,
              child: const Text("no food today"),
            );
          }

          return const DelayedLoadingIndicator(name: "Mealplan");
        });
  }
}
