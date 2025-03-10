import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ErrorNotifier extends ChangeNotifier {
  String? errorMessage;

  void setError(String message) {
    errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
  }
}
