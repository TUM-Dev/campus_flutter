abstract class ServiceTokenProtocol<T> {
  // TODO: needed?
  T fetch(String token, bool forcedRefresh);
}

abstract class ServiceProtocol<T> {
  // TODO: needed?
  List<T> fetch(bool forcedRefresh);
}