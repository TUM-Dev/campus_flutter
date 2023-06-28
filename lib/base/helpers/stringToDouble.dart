double stringToDouble(String? number) {
  if (number != null) {
    number = number.replaceAll(",", ".");
    return double.tryParse(number) ?? 0.0;
  } else {
    return 0.0;
  }
}

double? optStringToOptDouble(String? number) {
  return number != null ? double.tryParse(number) : null;
}