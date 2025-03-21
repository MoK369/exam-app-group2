import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ErrorNotifier extends ChangeNotifier {
  String? errorMessage;
  String widgetName = "";

  void setError({required String message, required String widgetName}) {
    this.widgetName = widgetName;
    errorMessage = message;
    notifyListeners();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        clearError();
      },
    );
  }

  void clearError() {
    errorMessage = null;
    widgetName = "";
  }
}
