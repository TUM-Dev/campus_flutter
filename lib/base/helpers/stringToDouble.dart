double stringToDouble(String number) {
  number = number.replaceAll(",", ".");
  return double.parse(number);
}