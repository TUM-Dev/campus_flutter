import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/extensions/custom_exception.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/mensa_menu.dart';
import 'package:campus_flutter/placesComponent/services/cafeterias_service.dart';
import 'package:campus_flutter/placesComponent/services/mealplan_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

class CafeteriasViewModel {
  BehaviorSubject<Map<Campus, List<Cafeteria>>?> campusCafeterias =
      BehaviorSubject.seeded(null);

  BehaviorSubject<(Cafeteria, CafeteriaMenu)?> closestCafeteria =
      BehaviorSubject.seeded(null);

  List<Cafeteria> cafeterias = [];
  DateTime? lastFetched;

  Future fetch(bool forcedRefresh) async {
    return CafeteriasService.fetchCafeterias(forcedRefresh).then((value) {
      lastFetched = value.$1;
      _categorizeAndSort(value.$2);
    }, onError: (error) => campusCafeterias.addError(error));
  }

  Future fetchClosestCafeteria(bool forcedRefresh) async {
    return Future.wait([
      CafeteriasService.fetchCafeterias(forcedRefresh),
      LocationService.getLastKnown()
    ]).then((value) {
      final cafeterias = value[0] as (DateTime?, List<Cafeteria>);
      lastFetched = cafeterias.$1;
      _categorizeAndSort(cafeterias.$2);
      _getClosestCafeteria(value[1] as Position?, cafeterias.$2);
    }, onError: (error) => campusCafeterias.addError(error));
  }

  _categorizeAndSort(List<Cafeteria> cafeterias) {
    Map<Campus, List<Cafeteria>> campusCafeterias = {};
    for (var campus in Campus.values) {
      final closeCafeterias = cafeterias.where((element) {
        return Geolocator.distanceBetween(
                campus.location.latitude,
                campus.location.longitude,
                element.location.latitude,
                element.location.longitude) <=
            1000;
      }).toList();

      campusCafeterias[campus] = closeCafeterias;
    }
    this.campusCafeterias.add(campusCafeterias);
    this.cafeterias = cafeterias;
  }

  _getClosestCafeteria(Position? position, List<Cafeteria> cafeterias) async {
    if (position != null) {
      final cafeteria = cafeterias.reduce((currentCafeteria, nextCafeteria) {
        final distanceCurrent = Geolocator.distanceBetween(
            currentCafeteria.location.latitude,
            currentCafeteria.location.longitude,
            position.latitude,
            position.longitude);

        final distanceNext = Geolocator.distanceBetween(
            nextCafeteria.location.latitude,
            nextCafeteria.location.longitude,
            position.latitude,
            position.longitude);

        if (distanceCurrent < distanceNext) {
          return currentCafeteria;
        } else {
          return nextCafeteria;
        }
      });

      fetchCafeteriaMenu(false, cafeteria).then((value) {
        final today = value.firstOrNull;
        if (today == null) {
          closestCafeteria.addError("Could not fetch closest cafeteria!");
        } else {
          closestCafeteria.add((cafeteria, today));
        }
      },
          onError: (error) =>
              closestCafeteria.addError("Could not fetch closest cafeteria!"));
    } else {
      closestCafeteria.addError("Could not fetch closest cafeteria!");
    }
  }

  Future<List<CafeteriaMenu>> fetchCafeteriaMenu(
      bool forcedRefresh, Cafeteria cafeteria) {
    return MealPlanService.getCafeteriaMenu(forcedRefresh, cafeteria).then(
        (response) => response.$2,
        onError: (error) => Future<List<CafeteriaMenu>>.error(
            CustomException("Unable to fetch meal plan")));
  }

  List<(Dish, String)> getTodayDishes(CafeteriaMenu? cafeteriaMenu) {
    List<(Dish, String)> dishes = [];
    if (cafeteriaMenu != null) {
      for (MenuCategory category in cafeteriaMenu.categories) {
        for (var dish in category.dishes) {
          dishes.add((dish, _getTypeLabel(dish.dishType)));
        }
      }
      dishes.sort((dish1, dish2) => dish1.$2.compareTo(dish2.$2));
    }
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
      case var string when string.contains("HG"):
      case "DishType.VEGAN":
        return "🍲";

      case "Beilagen":
      case var string when RegExp(r"B\d").hasMatch(string):
      case "DishType.VEGETARIAN":
        return "🥗";

      case "Fisch":
        return "🐟";

      case "DishType.SOUP":
      case "Suppe":
        return "🍜";

      case "Süßspeise":
      case var string when RegExp(r"N\d").hasMatch(string):
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
      unitPriceString =
          '${priceFormatter.format(price.unitPrice!)} / ${price.unit!}';
    }

    final divider = (basePriceString?.isNotEmpty == true &&
            unitPriceString?.isNotEmpty == true)
        ? ' + '
        : '';

    final finalPrice =
        (basePriceString ?? '') + divider + (unitPriceString ?? '');

    return finalPrice;
  }
}
