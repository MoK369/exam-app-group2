import 'package:exam_app_group2/core/api/api_error/api_error_model.dart';

sealed class ApiResult<T> {}

class Success<T> extends ApiResult<T> {
  T data;

  Success({required this.data});
}

class Error<T> extends ApiResult<T> {
  ApiErrorModel apiErrorModel;

  Error({required this.apiErrorModel});
}