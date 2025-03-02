import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../entities/question_entity.dart';
import '../repo_contract/home_repo_contract.dart';

@injectable
class GetAllQuestionsUseCase {
  final HomeRepo homeRepo;

  GetAllQuestionsUseCase({required this.homeRepo});

  Future<ApiResult<List<QuestionEntity>>> execute({required String examId}) {
    return homeRepo.getAllQuestions(examId);
  }
}
