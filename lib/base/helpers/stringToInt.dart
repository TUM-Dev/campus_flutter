int stringToInt(String? number) {
  if (number != null) {
    return int.tryParse(number) ?? 0;
  } else {
    return 0;
  }

}

int? optStringToOptInt(String? number) {
  return number != null ? int.tryParse(number) : null;
}