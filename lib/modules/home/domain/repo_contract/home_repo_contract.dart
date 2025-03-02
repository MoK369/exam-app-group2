import 'package:exam_app_group2/modules/home/domain/entities/question_entity.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../entities/exam_entity.dart';

abstract interface class HomeRepo {
  Future<ApiResult<List<SubjectEntity>?>> getAllSubjects();

  Future<ApiResult<List<ExamEntity>?>> getAllExamsOnSubject(String subjectId);

  Future<ApiResult<List<QuestionEntity>>> getAllQuestions(String examId);
}
