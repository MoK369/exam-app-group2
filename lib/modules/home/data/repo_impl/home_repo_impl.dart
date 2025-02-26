import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/data/datasource_contract/home_data_source_contract.dart';
import 'package:exam_app_group2/modules/home/data/models/all_subjects_response/get_all_subjects_response.dart';
import 'package:exam_app_group2/modules/home/domain/entities/subject_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo_contract/home_repo_contract.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;

  HomeRepoImpl({required this.homeDataSource});

  @override
  Future<ApiResult<List<SubjectEntity>?>> getAllSubjects() async {
    var result = await homeDataSource.getAllSubjects();
    switch (result) {
      case Success<GetAllSubjectsResponse>():
        return Success(
          data: result.data.subjects
              ?.map((subject) => subject.toEntity())
              .toList(),
        );
      case Error<GetAllSubjectsResponse>():
        return Error(error: result.error);
    }
  }
}
