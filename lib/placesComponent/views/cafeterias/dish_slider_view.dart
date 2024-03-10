import 'package:campus_flutter/base/helpers/horizontal_slider.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/views/cafeterias/dish_card_view.dart';
import 'package:flutter/material.dart';

class DishSliderView extends StatelessWidget {
  const DishSliderView({
    super.key,
    required this.dishes,
    this.inverted = false,
  });

  final List<(Dish, String)> dishes;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return HorizontalSlider<(Dish, String)>.height(
      data: dishes,
      height: 160,
      leadingTrailingPadding: !inverted,
      child: (dish) {
        return DishCardView(
          dish: dish,
          inverted: inverted,
        );
      },
    );
  }
}
