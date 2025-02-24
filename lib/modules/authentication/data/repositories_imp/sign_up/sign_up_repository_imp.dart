import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/authentication/data/data_sources_contracts/sign_up/sign_up_remote_data_source.dart';
import 'package:exam_app_group2/modules/authentication/data/models/sign_up/request/sign_up_request_parameters.dart';
import 'package:exam_app_group2/modules/authentication/domain/entities/authentication/authentication_response_entity.dart';
import 'package:exam_app_group2/modules/authentication/domain/repositories_constracts/sign_up/sign_up_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImp implements SignUpRepository {
  SignUpRemoteDataSource signUpRemoteDataSource;
  SignUpRepositoryImp({required this.signUpRemoteDataSource});
  @override
  Future<ApiResult<AuthenticationResponseEntity>> signUp(
      {required SignUpRequestParameters signUpParameters}) {
    return signUpRemoteDataSource.signUp(signUpParameters: signUpParameters);
  }
}
