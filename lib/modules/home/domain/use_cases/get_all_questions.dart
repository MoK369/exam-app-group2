import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../entities/question_entity.dart';

@injectable
class GetAllQuestionsUseCase {
  final ExploreRepository homeRepo;

  GetAllQuestionsUseCase({required this.homeRepo});

  Future<ApiResult<List<QuestionEntity>>> execute({required String examId}) {
    return homeRepo.getAllQuestions(examId);
  }
}
