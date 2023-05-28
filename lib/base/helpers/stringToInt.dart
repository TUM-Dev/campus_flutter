int stringToInt(String number) {
  number = number.replaceAll(",", ".");
  return int.tryParse(number) ?? 0;
}