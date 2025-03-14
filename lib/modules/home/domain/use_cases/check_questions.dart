import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../../data/models/check_questions/check_questions_request.dart';
import '../entities/check_questions_response_entity.dart';

@injectable
class CheckQuestionsUseCase {
  ExploreRepository homeRepository;

  CheckQuestionsUseCase({required this.homeRepository});

  Future<ApiResult<CheckQuestionsResponseEntity>> execute(
      {required CheckQuestionsRequest checkQuestionRequest}) {
    return homeRepository.checkQuestions(
        checkQuestionRequest: checkQuestionRequest);
  }
}
