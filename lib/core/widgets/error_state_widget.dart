import 'package:exam_app_group2/core/api/api_error/api_error_handler.dart';
import 'package:exam_app_group2/core/bases/base_stateless_widget.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends BaseStatelessWidget {
  final Object error;

  ErrorStateWidget({super.key, required this.error});

  @override
  Widget customBuild(BuildContext context) {
    final ApiErrorHandler apiErrorHandler =
        ApiErrorHandler.getInstance(appLocalizations);
    return Center(
      child: Text(
        apiErrorHandler.handle(error).message ?? "",
        textAlign: TextAlign.center,
        style: theme.textTheme.labelMedium,
      ),
    );
  }
}
