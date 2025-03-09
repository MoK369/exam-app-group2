import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/cahed_questions/cashed_questions_entity.dart';

@injectable
class GetCashedQuestionUseCase {
  ExploreRepository exploreRepository;

  GetCashedQuestionUseCase({required this.exploreRepository});

  Future<List<CashedQuestions>?> execute() {
    return exploreRepository.getCashedQuestionsAndAnswers();
  }
}
