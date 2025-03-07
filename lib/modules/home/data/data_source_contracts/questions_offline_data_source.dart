import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';

abstract interface class QuestionsOfflineDataSource {
  Future<void> saveCashedQuestions(CashedQuestions cashedQuestions);

  Future<CashedQuestions?> getCashedQuestionsAndAnswers(String examId);
}
