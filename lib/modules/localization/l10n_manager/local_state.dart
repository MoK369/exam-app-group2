import 'package:equatable/equatable.dart';
import 'package:exam_app_group2/core/languages/language_codes.dart';

enum LocaleStatus { arabic, english }

class LocaleState extends Equatable {
  final LocaleStatus state;
  final String languageCode;

  const LocaleState(
      {this.state = LocaleStatus.english,
      this.languageCode = LanguagesCodes.english});

  @override
  List<Object?> get props => [state, languageCode];

  LocaleState copyWith(
      {LocaleStatus state = LocaleStatus.english,
      String languageCode = LanguagesCodes.english}) {
    return LocaleState(state: state, languageCode: languageCode);
  }
}
