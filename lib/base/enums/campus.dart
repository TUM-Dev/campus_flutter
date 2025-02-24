import 'package:campus_flutter/homeComponent/model/station.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum Campus {
  stammgelaende("Stammgelände"),
  olympiapark("Campus Olympiapark"),
  klinikumRechts("Klinikum rechts der Isar"),
  grosshadern("Klinikum Großhadern"),
  garching("Garching Forschungszentrum"),
  freising("Campus Freising");

  final String name;

  const Campus(this.name);
}

extension CampusExtension on Campus {
  static List<Campus> get campusPlaces {
    return [
      Campus.stammgelaende,
      Campus.garching,
      Campus.olympiapark,
      Campus.klinikumRechts,
      Campus.freising,
    ];
  }

  String get searchStringRooms {
    switch (this) {
      case Campus.stammgelaende:
        return "Stammgelände";
      case Campus.olympiapark:
        return "Olympiapark";
      case Campus.klinikumRechts:
        return "Klinikum Isar";
      case Campus.grosshadern:
        return "Großhadern";
      case Campus.garching:
        return "Garching Forschungszentrum";
      case Campus.freising:
        return "Weihenstephan";
    }
  }

  String? get image {
    switch (this) {
      case Campus.stammgelaende:
        return "assets/images/campus/campus-stamm.jpeg";
      case Campus.olympiapark:
        return "assets/images/campus/campus-olympia.jpg";
      case Campus.klinikumRechts:
        return "assets/images/campus/campus-klinikum.jpg";
      case Campus.garching:
        return "assets/images/campus/campus-garching.jpeg";
      case Campus.freising:
        return "assets/images/campus/campus-freising.jpg";
      default:
        return null;
    }
  }

  LatLng get location {
    switch (this) {
      case Campus.stammgelaende:
        return const LatLng(48.14887567648079, 11.568029074814328);
      case Campus.olympiapark:
        return const LatLng(48.17957305879896, 11.546601863009668);
      case Campus.klinikumRechts:
        return const LatLng(48.13760759635786, 11.60083902677729);
      case Campus.grosshadern:
        return const LatLng(48.1116433849602, 11.47027262422505);
      case Campus.garching:
        return const LatLng(48.26513710129958, 11.671590834492283);
      case Campus.freising:
        return const LatLng(48.39549985559942, 11.727904526510946);
    }
  }

  Map<Campus, LatLng> getAll() {
    return Map.fromEntries(Campus.values.map((e) => MapEntry(e, e.location)));
  }

  Station get defaultStation {
    switch (this) {
      case Campus.stammgelaende:
        return Station(
          name: "Technische Universität",
          apiName: "91000095",
          location: const LatLng(48.148145129847244, 11.566048520744298),
        );
      case Campus.olympiapark:
        return Station(
          name: "Olympiazentrum",
          apiName: "91000350",
          location: const LatLng(48.17946648767361, 11.555783595899824),
        );
      case Campus.klinikumRechts:
        return Station(
          name: "Max-Weber-Platz",
          apiName: "91000580",
          location: const LatLng(48.13573243097588, 11.599014647301777),
        );
      case Campus.grosshadern:
        return Station(
          name: "Klinikum Großhadern",
          apiName: "91001540",
          location: const LatLng(48.10889880944028, 11.47363212095666),
        );
      case Campus.garching:
        return Station(
          name: "Forschungszentrum",
          apiName: "1000460",
          location: const LatLng(48.26519145730091, 11.671545161597082),
        );
      case Campus.freising:
        return Station(
          name: "Freising, Weihenstephan",
          apiName: "1002911",
          location: const LatLng(48.39799498961109, 11.723989661968458),
        );
    }
  }

  List<Station> get allStations {
    switch (this) {
      case Campus.stammgelaende:
        return [
          defaultStation,
          Station(
            name: "Theresienstraße",
            apiName: "91000120",
            location: const LatLng(48.1512235719802, 11.564211669898931),
          ),
          Station(
            name: "Pinakotheken",
            apiName: "91000051",
            location: const LatLng(48.148780089472, 11.571870970398924),
          ),
        ];
      case Campus.olympiapark:
        return [defaultStation];
      case Campus.klinikumRechts:
        return [
          defaultStation,
          Station(
            name: "Friedensengel/Villa Stuck",
            apiName: "91000073",
            location: const LatLng(48.14074544433942, 11.600075277341709),
          ),
        ];
      case Campus.grosshadern:
        return [
          defaultStation,
          Station(
            name: "Klinikum Großhadern Ost",
            apiName: "91001472",
            location: const LatLng(48.11092668280441, 11.473909030506093),
          ),
          Station(
            name: "Klinikum Großhadern Nord",
            apiName: "91001474",
            location: const LatLng(48.11250562334001, 11.467122898318992),
          ),
        ];
      case Campus.garching:
        return [
          defaultStation,
          Station(
            name: "Lichtenbergstraße",
            apiName: "1002070",
            location: const LatLng(48.26777168760462, 11.665502685140389),
          ),
        ];
      case Campus.freising:
        return [
          defaultStation,
          Station(
            name: "Freising, Forstzentrum",
            apiName: "1009413",
            location: const LatLng(48.39924842116169, 11.716601891310122),
          ),
          Station(
            name: "Freising, Weihenstephaner Berg",
            apiName: "1002617",
            location: const LatLng(48.39581877364193, 11.725859432987532),
          ),
        ];
    }
  }
}
