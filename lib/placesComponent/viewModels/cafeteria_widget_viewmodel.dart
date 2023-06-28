import 'package:campus_flutter/base/networking/protocols/view_model.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/mensa_menu.dart';
import 'package:campus_flutter/placesComponent/services/cafeterias_service.dart';
import 'package:campus_flutter/placesComponent/services/mealplan_service.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class CafeteriaWidgetViewModel implements ViewModel {
  BehaviorSubject<Cafeteria?> cafeteria = BehaviorSubject.seeded(null);
  BehaviorSubject<CafeteriaMenu?> cafeteriaMenu = BehaviorSubject.seeded(null);

  final BehaviorSubject<DateTime?> lastFetched = BehaviorSubject.seeded(null);

  @override
  Future fetch(bool forcedRefresh) async {
    CafeteriasService.fetchCafeterias(forcedRefresh).then((response) async {
      final location = await LocationService.getLastKnown();
      _getClosestCafeteria(forcedRefresh, response, location);
    }, onError: (error) => cafeteria.addError(error));
  }

  _getClosestCafeteria(bool forcedRefresh, (DateTime?, List<Cafeteria>) response, Position? location) {
    lastFetched.add(response.$1);

    if (location != null) {
      final cafeteria = response.$2.reduce((currentCafeteria, nextCafeteria) {
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

      MealPlanService.getCafeteriaMenu(forcedRefresh, cafeteria).then(
          (response) => cafeteriaMenu.add(response.$2.firstOrNull),
          onError: (error) => cafeteriaMenu.addError(error));
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
    switch (dishType) {
      case "Wok":
        return "🥘";

      case "Pasta":
        return "🍝";

      case "Pizza":
        return "🍕";

      case "Fleisch":
      case "DishType.MEAT":
        return "🥩";

      case "Grill":
        return "🍖";

      case "Studitopf":
      case "DishType.VEGAN":
        return "🍲";

      case "Beilagen":
      case "DishType.VEGETARIAN":
        return "🥗";

      case "Fisch":
        return "🐟";

      case "DishType.SOUP":
        return "🍜";

      case "Süßspeise":
        return "🍰";

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