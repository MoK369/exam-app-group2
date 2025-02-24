import 'package:exam_app_group2/core/api/api_error/api_error_handler.dart';
import 'package:exam_app_group2/core/api/api_result/api_result.dart';

Future<ApiResult<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(
      data: result,
    );
  } catch (error) {
    return Error(
      apiErrorModel: ApiErrorHandler.handle(error),
    );
  }
}