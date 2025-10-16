import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/mensa_menu.dart';
import 'package:campus_flutter/placesComponent/services/cafeterias_service.dart';
import 'package:campus_flutter/placesComponent/services/mealplan_service.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

final cafeteriasViewModel = Provider((ref) => CafeteriasViewModel());

const List<String> excludedCafeterias = [
  "stucafe-karlstr",
  "stucafe-pasing",
  "ipp-bistro",
  "mediziner-mensa",
];

class CafeteriasViewModel {
  BehaviorSubject<Map<Campus, List<Cafeteria>>?> campusCafeterias =
      BehaviorSubject.seeded(null);

  BehaviorSubject<(Cafeteria, CafeteriaMenu?)?> widgetCafeteria =
      BehaviorSubject.seeded(null);

  Future<void> setWidgetCafeteria(String id) async {
    final newCafeteria = cafeterias.firstWhereOrNull(
      (element) => element.id == id,
    );
    if (newCafeteria != null) {
      fetchCafeteriaMenu(false, newCafeteria).then(
        (value) => widgetCafeteria.add((newCafeteria, value.firstOrNull)),
        onError: (error) => widgetCafeteria.addError(error),
      );
      getIt<UserPreferencesService>().save(UserPreference.cafeteria, id);
    }
  }

  List<Cafeteria> cafeterias = [];
  DateTime? lastFetched;

  Future fetch(bool forcedRefresh) async {
    return CafeteriasService.fetchCafeterias(forcedRefresh).then((value) {
      lastFetched = value.$1;
      _excludeCafeterias(value.$2);
      _categorizeAndSort(value.$2);
    }, onError: (error) => campusCafeterias.addError(error));
  }

  Future<void> fetchWidgetCafeteria(bool forcedRefresh) async {
    final preferenceId = getIt<UserPreferencesService>().load(
      UserPreference.cafeteria,
    );

    return CafeteriasService.fetchCafeterias(forcedRefresh).then((value) {
      lastFetched = value.$1;
      _excludeCafeterias(value.$2);
      _categorizeAndSort(value.$2);
      final selectedCafeteria = value.$2.firstWhereOrNull(
        (element) => element.id == preferenceId,
      );
      if (selectedCafeteria != null) {
        fetchCafeteriaMenu(forcedRefresh, selectedCafeteria).then(
          (value) =>
              widgetCafeteria.add((selectedCafeteria, value.firstOrNull)),
          onError: (error) => widgetCafeteria.addError(error),
        );
      } else {
        LocationService.getLastKnown().then(
          (position) => _getClosestCafeteria(position, value.$2),
          onError: (error) =>
              fetchCafeteriaMenu(forcedRefresh, value.$2.first).then(
                (menu) =>
                    widgetCafeteria.add((value.$2.first, menu.firstOrNull)),
                onError: (error) => widgetCafeteria.addError(error),
              ),
        );
      }
    }, onError: (error) => widgetCafeteria.addError(error));
  }

  void _excludeCafeterias(List<Cafeteria> cafeterias) {
    cafeterias.removeWhere(
      (element) => excludedCafeterias.contains(element.id),
    );
  }

  void _categorizeAndSort(List<Cafeteria> cafeterias) {
    Map<Campus, List<Cafeteria>> campusCafeterias = {};
    for (var campus in Campus.values) {
      final closeCafeterias = cafeterias.where((element) {
        return Geolocator.distanceBetween(
              campus.location.latitude,
              campus.location.longitude,
              element.location.latitude,
              element.location.longitude,
            ) <=
            1000;
      }).toList();

      campusCafeterias[campus] = closeCafeterias;
    }
    this.campusCafeterias.add(campusCafeterias);
    this.cafeterias = cafeterias;
  }

  Future<void> _getClosestCafeteria(
    Position? position,
    List<Cafeteria> cafeterias,
  ) async {
    if (position != null) {
      final closestCafeteriaToLocation = cafeterias
          .sorted(
            (a, b) =>
                Geolocator.distanceBetween(
                  a.location.latitude,
                  a.location.longitude,
                  position.latitude,
                  position.longitude,
                ).compareTo(
                  Geolocator.distanceBetween(
                    b.location.latitude,
                    b.location.longitude,
                    position.latitude,
                    position.longitude,
                  ),
                ),
          )
          .first;

      fetchCafeteriaMenu(false, closestCafeteriaToLocation).then(
        (value) => widgetCafeteria.add((
          closestCafeteriaToLocation,
          value.firstOrNull,
        )),
        onError: (error) => widgetCafeteria.addError(error),
      );
    } else {
      final defaultCafeteria =
          cafeterias.firstWhereOrNull(
            (element) => element.id == "mensa-garching",
          ) ??
          cafeterias.first;
      fetchCafeteriaMenu(false, defaultCafeteria).then(
        (value) => widgetCafeteria.add((defaultCafeteria, value.firstOrNull)),
        onError: (error) => widgetCafeteria.addError(error),
      );
    }
  }

  List<ListTile> getCafeteriaEntries(BuildContext context) {
    return cafeterias.map((e) {
      final isSelected =
          widgetCafeteria.value?.$1.id == e.id &&
          getIt<UserPreferencesService>().load(UserPreference.cafeteria) !=
              null;
      return ListTile(
        dense: true,
        title: Text(e.name),
        trailing: isSelected ? const Icon(Icons.check) : null,
        onTap: () {
          setWidgetCafeteria(e.id);
          context.pop();
        },
      );
    }).toList()..insert(
      0,
      ListTile(
        dense: true,
        title: Text(context.tr("closest")),
        trailing:
            getIt<UserPreferencesService>().load(UserPreference.cafeteria) ==
                null
            ? const Icon(Icons.check)
            : null,
        onTap: () {
          getIt<UserPreferencesService>().reset(UserPreference.cafeteria);
          fetchWidgetCafeteria(false);
          context.pop();
        },
      ),
    );
  }

  Future<List<CafeteriaMenu>> fetchCafeteriaMenu(
    bool forcedRefresh,
    Cafeteria cafeteria,
  ) {
    return MealPlanService.getCafeteriaMenu(
      forcedRefresh,
      cafeteria,
    ).then((response) => response.$2, onError: (error) => error);
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
      case var string when string.contains("Tagesgericht"):
      case var string when string.contains("Aktionsessen"):
      case "Aktion":
      case "DishType.VEGAN":
        return "🍲";

      case "Beilagen":
      case var string when RegExp(r"B\d").hasMatch(string):
      case "Vegetarisch/fleischlos":
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
        return "🍴";
    }
  }

  static String? formatPrice(
    Dish dish,
    BuildContext context, {
    String pricingGroup = "students",
  }) {
    final NumberFormat priceFormatter = NumberFormat.currency(symbol: '€');

    Price? price;
    String? basePriceString;
    String? unitPriceString;

    switch (pricingGroup) {
      case 'staff':
        price = dish.prices['staff'];
        break;
      case 'guests':
        price = dish.prices['guests'];
        break;
      default:
        price = dish.prices['students'];
    }

    if (price == null) {
      return null;
    }

    if (price.basePrice != null && price.basePrice != 0) {
      basePriceString = priceFormatter.format(price.basePrice!);
    }

    if (price.unitPrice != null && price.unit != null && price.unitPrice != 0) {
      unitPriceString =
          '${priceFormatter.format(price.unitPrice!)} / ${price.unit!}';
    }

    final divider =
        (basePriceString?.isNotEmpty == true &&
            unitPriceString?.isNotEmpty == true)
        ? ' + '
        : '';

    final finalPrice =
        (basePriceString ?? '') + divider + (unitPriceString ?? '');

    return finalPrice;
  }

  Set<Marker> mapMakers(BuildContext context) {
    if (cafeterias.isNotEmpty) {
      return cafeterias
          .map(
            (e) => Marker(
              markerId: MarkerId(const Uuid().v4()),
              position: LatLng(e.location.latitude, e.location.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(208),
              infoWindow: InfoWindow(
                title: e.name,
                onTap: () => context.push(cafeteria, extra: e),
              ),
            ),
          )
          .toSet();
    } else {
      return {};
    }
  }

  Set<Marker> mapMakersCampus(BuildContext context, Campus campus) {
    if (campusCafeterias.value != null) {
      return (campusCafeterias.value![campus] ?? [])
          .map(
            (e) => Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(e.location.latitude, e.location.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(208),
              infoWindow: InfoWindow(
                title: e.name,
                onTap: () => context.push(cafeteria, extra: e),
              ),
            ),
          )
          .toSet();
    } else {
      return {};
    }
  }
}
