import 'package:campus_flutter/base/helpers/cardWithPadding.dart';
import 'package:campus_flutter/base/helpers/delayedLoadingIndicator.dart';
import 'package:campus_flutter/base/helpers/horizontalSlider.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/viewModels/cafeteria_widget_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CafeteriaWidgetView extends StatefulWidget {
  const CafeteriaWidgetView({super.key});

  @override
  State<StatefulWidget> createState() => _CafeteriaWidgetViewState();
}

class _CafeteriaWidgetViewState extends State<CafeteriaWidgetView> {

  @override
  void initState() {
    Provider.of<CafeteriaWidgetViewModel>(context, listen: false).getClosestCafeteria();
    super.initState();
  }

  // TODO: make nice
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<CafeteriaWidgetViewModel>(context).cafeteriaMenu,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dishes = Provider.of<CafeteriaWidgetViewModel>(context).getTodayDishes();
            return HorizontalSlider<(Dish, String)>(data: dishes, height: 160, child: (dish) {
              return _dishCard(dish);
            });
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            return const Card(
                child: SizedBox(
                    height: 150,
                    child: DelayedLoadingIndicator(name: "Mealplan")));
          }
        }
    );
  }

  Widget _dishCard((Dish, String) dish) {
    return CardWithPadding(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(width: 130, child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dish.$2, style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                // TODO: figure out button
                //MaterialButton(onPressed: () {}, child: Icon(Icons.info_outline, color: Theme.of(context).primaryColor))
                Icon(Icons.info_outline, color: Theme.of(context).primaryColor)
              ],
            )),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Expanded(flex: 3, child: Text(dish.$1.name, maxLines: 3, overflow: TextOverflow.ellipsis,)),
            Expanded(child: Text(CafeteriaWidgetViewModel.formatPrice(dish.$1), maxLines: 1,))
          ],
        )
    ));
  }
}