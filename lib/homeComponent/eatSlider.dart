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
                  for (var dish in snapShot.data!.dishes) ...[
                    Container(
                        width: 160, color: Colors.blue, child: Text(dish.name)),
                    const Padding(padding: EdgeInsets.only(right: 8))
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

          return const CircularProgressIndicator();
        });
  }
}
