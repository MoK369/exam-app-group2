import '../../modules/authentication/data/model/api_error_model.dart';

sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;

  Success({required this.data});
}

class Error<T> extends Result<T> {
  ApiErrorModel apiErrorModel;

  Error({required this.apiErrorModel});
}
