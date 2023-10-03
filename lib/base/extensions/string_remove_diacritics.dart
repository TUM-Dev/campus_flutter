extension RemoveDiacritics on String {
  /// found on: https://stackoverflow.com/a/64742829
  String removeDiacritics() {
    String string = this;

    var withDia =
        'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
    var withoutDia =
        'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

    for (int i = 0; i < withDia.length; i++) {
      string = string.replaceAll(withDia[i], withoutDia[i]);
    }

    return string;
  }
}
