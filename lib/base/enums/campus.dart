import 'package:campus_flutter/base/classes/location.dart';
import 'package:campus_flutter/departuresComponent/model/station.dart';

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

  Location get location {
    switch (this) {
      case Campus.stammgelaende:
        return Location(
          latitude: 48.14887567648079,
          longitude: 11.568029074814328,
        );
      case Campus.olympiapark:
        return Location(
          latitude: 48.17957305879896,
          longitude: 11.546601863009668,
        );
      case Campus.klinikumRechts:
        return Location(
          latitude: 48.13760759635786,
          longitude: 11.60083902677729,
        );
      case Campus.grosshadern:
        return Location(
          latitude: 48.1116433849602,
          longitude: 11.47027262422505,
        );
      case Campus.garching:
        return Location(
          latitude: 48.26513710129958,
          longitude: 11.671590834492283,
        );
      case Campus.freising:
        return Location(
          latitude: 48.39549985559942,
          longitude: 11.727904526510946,
        );
    }
  }

  Map<Campus, Location> getAll() {
    return Map.fromEntries(Campus.values.map((e) => MapEntry(e, e.location)));
  }

  Station get defaultStation {
    switch (this) {
      case Campus.stammgelaende:
        return Station(
          name: "Technische Universität",
          apiName: "91000095",
          location: Location(
            latitude: 48.148145129847244,
            longitude: 11.566048520744298,
          ),
        );
      case Campus.olympiapark:
        return Station(
          name: "Olympiazentrum",
          apiName: "91000350",
          location: Location(
            latitude: 48.17946648767361,
            longitude: 11.555783595899824,
          ),
        );
      case Campus.klinikumRechts:
        return Station(
          name: "Max-Weber-Platz",
          apiName: "91000580",
          location: Location(
            latitude: 48.13573243097588,
            longitude: 11.599014647301777,
          ),
        );
      case Campus.grosshadern:
        return Station(
          name: "Klinikum Großhadern",
          apiName: "91001540",
          location: Location(
            latitude: 48.10889880944028,
            longitude: 11.47363212095666,
          ),
        );
      case Campus.garching:
        return Station(
          name: "Forschungszentrum",
          apiName: "1000460",
          location: Location(
            latitude: 48.26519145730091,
            longitude: 11.671545161597082,
          ),
        );
      case Campus.freising:
        return Station(
          name: "Freising, Weihenstephan",
          apiName: "1002911",
          location: Location(
            latitude: 48.39799498961109,
            longitude: 11.723989661968458,
          ),
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
            location: Location(
              latitude: 48.1512235719802,
              longitude: 11.564211669898931,
            ),
          ),
          Station(
            name: "Pinakotheken",
            apiName: "91000051",
            location: Location(
              latitude: 48.148780089472,
              longitude: 11.571870970398924,
            ),
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
            location: Location(
              latitude: 48.14074544433942,
              longitude: 11.600075277341709,
            ),
          ),
        ];
      case Campus.grosshadern:
        return [
          defaultStation,
          Station(
            name: "Klinikum Großhadern Ost",
            apiName: "91001472",
            location: Location(
              latitude: 48.11092668280441,
              longitude: 11.473909030506093,
            ),
          ),
          Station(
            name: "Klinikum Großhadern Nord",
            apiName: "91001474",
            location: Location(
              latitude: 48.11250562334001,
              longitude: 11.467122898318992,
            ),
          ),
        ];
      case Campus.garching:
        return [
          defaultStation,
          Station(
            name: "Lichtenbergstraße",
            apiName: "1002070",
            location: Location(
              latitude: 48.26777168760462,
              longitude: 11.665502685140389,
            ),
          ),
        ];
      case Campus.freising:
        return [
          defaultStation,
          Station(
            name: "Freising, Forstzentrum",
            apiName: "1009413",
            location: Location(
              latitude: 48.39924842116169,
              longitude: 11.716601891310122,
            ),
          ),
          Station(
            name: "Freising, Weihenstephaner Berg",
            apiName: "1002617",
            location: Location(
              latitude: 48.39581877364193,
              longitude: 11.725859432987532,
            ),
          ),
        ];
    }
  }
}
