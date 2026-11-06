class TumId {
  static String normalize(String input) => input.trim().toLowerCase();

  static String? validationError(String input) {
    final value = normalize(input);
    if (RegExp(r'^[a-z]{2}[0-9]{2}[a-z]{3}$').hasMatch(value)) return null;
    if (value.contains('@')) return 'tumIdEmailError';
    if (RegExp(r'^[0-9]+$').hasMatch(value)) return 'tumIdNumberError';
    return 'tumIdFormatError';
  }
}
