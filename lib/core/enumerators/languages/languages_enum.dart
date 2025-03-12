enum LanguagesEnum {
  en,
  ar,
}

extension LanguagesEnumExtension on LanguagesEnum {
  String getLanguageCode() {
    var result = toString().split(".").toList()[1];
    return result;
  }
}
