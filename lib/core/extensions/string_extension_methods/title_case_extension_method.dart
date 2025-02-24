extension TitleCaseExtension on String {
  String toTitleCase() {
    String lowerCase = this.trim().toLowerCase();
    String titleCase = lowerCase.replaceRange(0, 1, lowerCase[0].toUpperCase());
    return titleCase;
  }
}
