class LanguagesCodes {
  static const String english = 'en';
  static const String arabic = 'ar';

  static String getLanguageName(String languageCode) {
    switch (languageCode) {
      case english:
        return "English";
      case arabic:
        return "العربية";
      default:
        return "No Match";
    }
  }
}
