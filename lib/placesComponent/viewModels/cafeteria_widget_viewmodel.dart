import 'package:campus_flutter/base/services/locationService.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/mensa_menu.dart';
import 'package:campus_flutter/placesComponent/services/cafeterias_service.dart';
import 'package:campus_flutter/placesComponent/services/mealplan_service.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class CafeteriaWidgetViewModel {
  BehaviorSubject<Cafeteria?> cafeteria = BehaviorSubject.seeded(null);
  BehaviorSubject<CafeteriaMenu?> cafeteriaMenu = BehaviorSubject.seeded(null);

  getClosestCafeteria() async {
    final response = await CafeteriasService.fetchCafeterias();
    final location = await LocationService.getLastKnown();

    if (location != null) {
      final cafeteria = response.reduce((currentCafeteria, nextCafeteria) {
        final distanceCurrent = Geolocator.distanceBetween(
            currentCafeteria.location.latitude,
            currentCafeteria.location.longitude,
            location.latitude,
            location.longitude
        );

        final distanceNext = Geolocator.distanceBetween(
            nextCafeteria.location.latitude,
            nextCafeteria.location.longitude,
            location.latitude,
            location.longitude
        );

        if (distanceCurrent < distanceNext) {
          return currentCafeteria;
        } else {
          return nextCafeteria;
        }
      });

      this.cafeteria.add(cafeteria);

      final menus = await MealPlanService.getCafeteriaMenu(cafeteria, false);
      cafeteriaMenu.add(menus.first);
    } else {
      return;
    }
  }

  List<(Dish, String)> getTodayDishes() {
    List<(Dish, String)> dishes = [];
    for (MenuCategory category in cafeteriaMenu.value?.categories ?? []) {
      for (var dish in category.dishes) {
        dishes.add((dish, _getTypeLabel(dish.dishType)));
      }
    }

    dishes.sort((dish1, dish2) => dish1.$2.compareTo(dish2.$2));
    return dishes;
  }

  String _getTypeLabel(String dishType) {
    // TODO: add al dish types, enum?
    switch (dishType) {
      case "Wok":
        return "🥘";
      case "Pasta":
        return "🍝";
      case "Pizza":
        return "🍕";
      case "DishType.MEAT":
        return "🥩";
      case "Grill":
        return "🍖";
      case "DishType.VEGAN":
        return "🍲";
      case "DishType.VEGETARIAN":
        return "🥗";
      case "Fisch":
        return "🐟";
      case "DishType.SOUP":
        return "🍜";
      default:
        return " ";
    }
  }

  static String formatPrice(Dish dish, {String pricingGroup = "students"}) {
    final NumberFormat priceFormatter = NumberFormat.currency(symbol: '€');

    Price price;
    String? basePriceString;
    String? unitPriceString;

    switch (pricingGroup) {
      case 'staff':
        price = dish.prices['staff']!;
        break;
      case 'guests':
        price = dish.prices['guests']!;
        break;
      default:
        price = dish.prices['students']!;
    }

    if (price.basePrice != null && price.basePrice != 0) {
      basePriceString = priceFormatter.format(price.basePrice!);
    }

    if (price.unitPrice != null && price.unit != null && price.unitPrice != 0) {
      unitPriceString = '${priceFormatter.format(price.unitPrice!)} / ${price.unit!}';
    }

    final divider = (basePriceString?.isNotEmpty == true && unitPriceString?.isNotEmpty == true) ? ' + ' : '';

    final finalPrice = (basePriceString ?? '') + divider + (unitPriceString ?? '');

    return finalPrice;
  }
}