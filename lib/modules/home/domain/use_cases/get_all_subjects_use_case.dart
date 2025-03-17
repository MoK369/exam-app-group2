import 'package:exam_app_group2/modules/home/domain/repositories_contracts/explore_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../entities/subject_entity.dart';

@injectable
class GetAllSubjectsUseCase {
  ExploreRepository repo;

  GetAllSubjectsUseCase({required this.repo});

  Future<ApiResult<List<SubjectEntity>?>> execute() {
    return repo.getAllSubjects();
  }
}
