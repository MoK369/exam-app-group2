import '../../../../core/api/api_result/api_result.dart';
import '../entities/exam_entity.dart';
import '../entities/question_entity.dart';
import '../entities/subject_entity.dart';

abstract interface class HomeRepository {
  Future<ApiResult<List<SubjectEntity>?>> getAllSubjects();

  Future<ApiResult<List<ExamEntity>?>> getAllExamsOnSubject(String subjectId);

  Future<ApiResult<List<QuestionEntity>>> getAllQuestions(String examId);
}
