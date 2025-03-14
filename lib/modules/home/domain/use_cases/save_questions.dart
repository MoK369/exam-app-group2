import 'package:exam_app_group2/modules/home/domain/entities/cahed_questions/cashed_questions_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveQuestionsUseCase {
  ExploreRepository exploreRepository;

  SaveQuestionsUseCase({required this.exploreRepository});

  Future<void> execute(CashedQuestions cashedQuestions) {
    return exploreRepository.saveCashedQuestions(cashedQuestions);
  }
}
