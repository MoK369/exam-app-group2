import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/check_questions_response_entity.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../../data/models/check_questions/check_questions_request.dart';
import '../entities/exam_entity.dart';
import '../entities/question_entity.dart';
import '../entities/subject_entity.dart';

abstract interface class ExploreRepository {
  Future<ApiResult<List<SubjectEntity>?>> getAllSubjects();

  Future<ApiResult<List<ExamEntity>?>> getAllExamsOnSubject(String subjectId);

  Future<ApiResult<List<QuestionEntity>>> getAllQuestions(String examId);

  Future<ApiResult<CheckQuestionsResponseEntity>> checkQuestions(
      {required CheckQuestionsRequest checkQuestionRequest});

  Future<CashedQuestions?> getCashedQuestionsAndAnswers(String examId);

  Future<void> saveCashedQuestions(CashedQuestions cashedQuestions);
}
