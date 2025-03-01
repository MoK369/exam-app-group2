import 'package:exam_app_group2/core/api/api_result/api_result.dart';

class ApiExecutor {
  static Future<ApiResult<T>> executeApi<T>(
      Future<T> Function() apiCall) async {
    try {
      var result = await apiCall.call();
      return Success(
        data: result,
      );
    } catch (error) {
      return Error(
        error: error,
      );
    }
  }
}