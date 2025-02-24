import 'package:campus_flutter/base/extensions/context.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/dish_card_view.dart';
import 'package:flutter/material.dart';

class DishGridView extends StatelessWidget {
  const DishGridView({
    super.key,
    required this.dishes,
    this.isLandscape = false,
    this.inverted = false,
  });

  final List<(Dish, String)> dishes;
  final bool isLandscape;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: isLandscape ? 3 : 2,
      crossAxisSpacing: 10.0,
      padding: EdgeInsets.symmetric(horizontal: context.padding),
      children:
          dishes
              .map((dish) => DishCardView(dish: dish, inverted: inverted))
              .toList(),
    );
  }
}
