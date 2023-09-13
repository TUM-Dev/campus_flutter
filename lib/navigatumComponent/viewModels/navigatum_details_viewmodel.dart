import 'package:campus_flutter/navigatumComponent/model/navigatum_navigation_details.dart';
import 'package:campus_flutter/navigatumComponent/services/navigatum_service.dart';
import 'package:rxdart/rxdart.dart';

class NavigaTumDetailsViewModel {
  BehaviorSubject<NavigaTumNavigationDetails?> details =
      BehaviorSubject.seeded(null);

  final String id;

  NavigaTumDetailsViewModel(this.id);

  Future fetchDetails(bool forcedRefresh) async {
    if (id.isEmpty) {
      details.addError("Unable to fetch room details");
      return;
    }

    return NavigaTumService.details(forcedRefresh, id).then(
        (value) => details.add(value),
        onError: (error) => details.addError(error));
  }
}
