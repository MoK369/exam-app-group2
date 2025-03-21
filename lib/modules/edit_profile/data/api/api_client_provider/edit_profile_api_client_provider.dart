import 'package:dio/dio.dart';
import 'package:exam_app_group2/modules/edit_profile/data/api/api_client/edit_profile_api_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class EditProfileApiClientProvider {
  @factoryMethod
  EditProfileApiClient provideApiClient(Dio dio) {
    return EditProfileApiClient(dio);
  }
}
