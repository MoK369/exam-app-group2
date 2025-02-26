import 'package:exam_app_group2/modules/home/data/api_manager/api_manager.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_excutor/api_excutor.dart';
import '../../../../core/api/api_result/api_result.dart';
import '../datasource_contract/home_data_source_contract.dart';
import '../models/all_subjects_response/get_all_subjects_response.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final ApiManager apiManager;

  HomeDataSourceImpl({required this.apiManager});

  @override
  Future<ApiResult<GetAllSubjectsResponse>> getAllSubjects() async {
    return await ApiExecutor.executeApi<GetAllSubjectsResponse>(
      () => apiManager.getAllSubjects(),
    );
  }
}
