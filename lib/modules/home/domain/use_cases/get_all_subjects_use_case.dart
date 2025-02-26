import 'package:exam_app_group2/modules/home/domain/repo_contract/home_repo_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_result/api_result.dart';
import '../entities/subject_entity.dart';

@injectable
class GetAllSubjectsUseCase {
  HomeRepo repo;

  GetAllSubjectsUseCase({required this.repo});

  Future<ApiResult<List<SubjectEntity>?>> execute() {
    return repo.getAllSubjects();
  }
}
