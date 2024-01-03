import 'dart:io';

class ConnectionChecker {
  bool _hasInternet = true;
  DateTime? _dateTime;

  ConnectionChecker() {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    if (_dateTime != null &&
        _dateTime!.difference(DateTime.now()).inSeconds < 30) {
      return _hasInternet;
    } else {
      _hasInternet = await _lookupInternetAddress();
      return _hasInternet;
    }
  }

  Future<bool> _lookupInternetAddress() {
    _dateTime = DateTime.now();
    return InternetAddress.lookup("google.com").then(
      (value) =>
          _hasInternet = (value.isNotEmpty && value[0].rawAddress.isNotEmpty),
      onError: (_) => false,
    );
  }

  bool hasInternet() {
    checkConnection();
    return _hasInternet;
  }
}
