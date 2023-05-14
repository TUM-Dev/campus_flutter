double? stringToDouble(String number) {
  number = number.replaceAll(",", ".");
  return double.tryParse(number);
}