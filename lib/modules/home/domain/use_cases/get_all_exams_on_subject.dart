import 'package:exam_app_group2/modules/home/domain/entities/exam_entity.dart';
import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';

@injectable
class GetAllExamsOnSubjectUseCase {
  final ExploreRepository homeRepo;

  GetAllExamsOnSubjectUseCase({required this.homeRepo});

  Future<ApiResult<List<ExamEntity>?>> execute(String subjectId) {
    return homeRepo.getAllExamsOnSubject(subjectId);
  }
}
