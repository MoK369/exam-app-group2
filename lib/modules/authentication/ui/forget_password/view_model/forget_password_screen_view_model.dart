import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordScreenViewModel extends ChangeNotifier {
  String _email = '';

  void changeEmail(String newValue) {
    _email = newValue;
  }

  String get email => _email;
}
