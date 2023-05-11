/// inspired by: https://stackoverflow.com/a/54664901/20473653
class Cache<Key, Value> {
  final Duration _cacheValidDuration = const Duration(minutes: 30);
  final Map<Key, Entry<Value>> _allRecords = {};

  Future<Value> getAllRecords({required Key key}) async{
    bool shouldRefreshFromApi = (_allRecords[key] == null || _allRecords[key]!.expirationDate.isBefore(DateTime.now()));

    if( shouldRefreshFromApi ) {
      // TODO: handeling
      throw Exception();
    }

    final value = _allRecords[key]?.value;

    if (value != null) {
      return value;
    } else {
      // TODO: handeling
      throw Exception();
    }
  }

  bool checkKeyInCache({required Key key}) {
    return _allRecords.containsKey(key) && _allRecords[key]!.expirationDate.isAfter(DateTime.now());
  }

  void saveAllRecords({required Value value, required Key key}) {
    _allRecords[key] = Entry(value: value, expirationDate: DateTime.now().add(_cacheValidDuration));
  }
}

class Entry<Value> {
  final Value value;
  final DateTime expirationDate;

  Entry({required this.value, required this.expirationDate});
}