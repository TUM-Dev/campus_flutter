import 'package:campus_flutter/base/enums/campus.dart';
import 'package:campus_flutter/base/enums/user_preference.dart';
import 'package:campus_flutter/base/providers/default_campus_provider.dart';
import 'package:campus_flutter/base/routing/routes.dart';
import 'package:campus_flutter/base/services/location_service.dart';
import 'package:campus_flutter/main.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/cafeteria_menu.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/dish.dart';
import 'package:campus_flutter/placesComponent/model/cafeterias/mensa_menu.dart';
import 'package:campus_flutter/placesComponent/model/maps/marker.dart';
import 'package:campus_flutter/placesComponent/services/cafeterias_service.dart';
import 'package:campus_flutter/placesComponent/services/mealplan_service.dart';
import 'package:campus_flutter/base/services/user_preferences_service.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

final cafeteriasViewModel = Provider((ref) {
  final model = CafeteriasViewModel(
    defaultCampus: ref.read(defaultCampusProvider),
  );
  ref.listen(
    defaultCampusProvider,
    (_, campus) => model.updateDefaultCampus(campus),
  );
  return model;
});

const List<String> excludedCafeterias = [
  "stucafe-karlstr",
  "stucafe-pasing",
  "ipp-bistro",
  "mediziner-mensa",
];

class CafeteriasViewModel {
  Campus? _defaultCampus;
  int _widgetRequest = 0;

  CafeteriasViewModel({Campus? defaultCampus}) : _defaultCampus = defaultCampus;

  BehaviorSubject<Map<Campus, List<Cafeteria>>?> campusCafeterias =
      BehaviorSubject.seeded(null);

  BehaviorSubject<(Cafeteria, CafeteriaMenu?)?> widgetCafeteria =
      BehaviorSubject.seeded(null);

  String? get _savedCafeteriaId =>
      getIt<UserPreferencesService>().load(UserPreference.cafeteria) as String?;

  void updateDefaultCampus(Campus? campus) {
    _defaultCampus = campus;
    if (_widgetRequest > 0 &&
        !cafeterias.any((c) => c.id == _savedCafeteriaId)) {
      fetchWidgetCafeteria(false);
    }
  }

  Future<void> setWidgetCafeteria(String id) async {
    final cafeteria = cafeterias.firstWhereOrNull(
      (element) => element.id == id,
    );
    if (cafeteria == null) return;
    final request = ++_widgetRequest;
    getIt<UserPreferencesService>().save(UserPreference.cafeteria, id);
    try {
      final menu = await fetchCafeteriaMenu(false, cafeteria);
      if (request != _widgetRequest) return;
      widgetCafeteriaLoaded = true;
      widgetCafeteria.add((cafeteria, menu.firstOrNull));
    } catch (error, stack) {
      if (request == _widgetRequest) widgetCafeteria.addError(error, stack);
    }
  }

  bool widgetCafeteriaLoaded = false;

  List<Cafeteria> cafeterias = [];
  DateTime? lastFetched;

  Future fetch(bool forcedRefresh) async {
    return CafeteriasService.fetchCafeterias(forcedRefresh).then(
      (value) {
        lastFetched = value.$1;
        _excludeCafeterias(value.$2);
        _categorizeAndSort(value.$2);
      },
      onError: (Object error, StackTrace stack) =>
          campusCafeterias.addError(error, stack),
    );
  }

  Future<void> fetchWidgetCafeteria(bool forcedRefresh) async {
    final request = ++_widgetRequest;
    widgetCafeteriaLoaded = false;
    widgetCafeteria.add(null);
    try {
      final response = await CafeteriasService.fetchCafeterias(forcedRefresh);
      if (request != _widgetRequest) return;
      lastFetched = response.$1;
      _excludeCafeterias(response.$2);
      _categorizeAndSort(response.$2);
      final cafeteria = await _resolveWidgetCafeteria(response.$2);
      if (request != _widgetRequest) return;
      final menu = cafeteria == null
          ? null
          : await fetchCafeteriaMenu(forcedRefresh, cafeteria);
      if (request != _widgetRequest) return;
      widgetCafeteriaLoaded = true;
      widgetCafeteria.add(
        cafeteria == null ? null : (cafeteria, menu?.firstOrNull),
      );
    } catch (error, stack) {
      if (request == _widgetRequest) widgetCafeteria.addError(error, stack);
    }
  }

  Future<Cafeteria?> _resolveWidgetCafeteria(List<Cafeteria> cafeterias) async {
    if (cafeterias.isEmpty) return null;
    final savedId = _savedCafeteriaId;
    final selected = cafeterias.firstWhereOrNull((c) => c.id == savedId);
    if (selected != null) return selected;

    final campus = _defaultCampus;
    if (campus != null) {
      final preferredId = campus.defaultCafeteriaId;
      final preferred = cafeterias.firstWhereOrNull((c) => c.id == preferredId);
      if (preferred != null) return preferred;
      // Avoid showing a cafeteria in a different city if the local data is missing.
      final nearby = cafeterias
          .where((c) => _distanceToCafeteria(campus.location, c) <= 5000)
          .toList();
      return nearby.isEmpty
          ? null
          : _getClosestCafeteria(campus.location, nearby);
    }

    final position = await LocationService.getLastKnown();
    return _getClosestCafeteria(
      position == null ? null : LatLng(position.latitude, position.longitude),
      cafeterias,
    );
  }

  void _excludeCafeterias(List<Cafeteria> cafeterias) {
    cafeterias.removeWhere(
      (element) => excludedCafeterias.contains(element.id),
    );
  }

  void _categorizeAndSort(List<Cafeteria> cafeterias) {
    Map<Campus, List<Cafeteria>> campusCafeterias = {};
    for (var campus in Campus.values) {
      final preferredId = campus.defaultCafeteriaId;
      final closeCafeterias = cafeterias.where((element) {
        if (preferredId != null && element.id == preferredId) return true;
        return Geolocator.distanceBetween(
              campus.location.latitude,
              campus.location.longitude,
              element.location.latitude,
              element.location.longitude,
            ) <=
            1500;
      }).toList();

      campusCafeterias[campus] = closeCafeterias;
    }
    this.campusCafeterias.add(campusCafeterias);
    this.cafeterias = cafeterias;
  }

  Cafeteria _getClosestCafeteria(LatLng? position, List<Cafeteria> cafeterias) {
    if (position == null) {
      return cafeterias.firstWhereOrNull(
            (cafeteria) => cafeteria.id == "mensa-garching",
          ) ??
          cafeterias.first;
    }
    return cafeterias.reduce(
      (a, b) =>
          _distanceToCafeteria(position, a) <= _distanceToCafeteria(position, b)
          ? a
          : b,
    );
  }

  double _distanceToCafeteria(LatLng position, Cafeteria cafeteria) =>
      Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        cafeteria.location.latitude,
        cafeteria.location.longitude,
      );

  List<ListTile> getCafeteriaEntries(BuildContext context) {
    final savedId = _savedCafeteriaId;
    return cafeterias.map((e) {
      return ListTile(
        dense: true,
        title: Text(e.name),
        trailing: savedId == e.id ? const Icon(Icons.check) : null,
        onTap: () {
          setWidgetCafeteria(e.id);
          context.pop();
        },
      );
    }).toList()..insert(
      0,
      ListTile(
        dense: true,
        title: Text(
          context.tr(_defaultCampus == null ? 'closest' : 'useDefaultCampus'),
        ),
        trailing: !cafeterias.any((c) => c.id == savedId)
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
    ).then((response) => response.$2);
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
              id: const Uuid().v4(),
              position: LatLng(e.location.latitude, e.location.longitude),
              isRed: true,
              // TODO:
              //icon: BitmapDescriptor.defaultMarkerWithHue(208),
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
              id: e.id.toString(),
              position: LatLng(e.location.latitude, e.location.longitude),
              isRed: true,
              // TODO:
              //icon: BitmapDescriptor.defaultMarkerWithHue(208),
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
