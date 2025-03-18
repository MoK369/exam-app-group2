import 'package:exam_app_group2/core/api/api_result/api_result.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/settings_layout/view_model/settings_intent.dart';
import 'package:exam_app_group2/modules/home/UI/layouts/settings_layout/view_model/settings_state.dart';
import 'package:exam_app_group2/modules/home/domain/entities/logout_and_delete/logout_delete_entity.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/delete_account/delete_account_use_case.dart';
import 'package:exam_app_group2/modules/home/domain/use_cases/logout/logout_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingsViewModel extends Cubit<SettingState> {
  LogoutUseCase _logoutUseCase;
  DeleteAccountUseCase _deleteAccountUseCase;

  SettingsViewModel(this._logoutUseCase, this._deleteAccountUseCase)
      : super(SettingState());

  void doIntent(SettingsIntent settingsIntent) {
    switch (settingsIntent) {
      case OnLogoutButtonClick():
        _logout();
        break;
      case OnDeleteAccountButtonClick():
        _deleteAccount();
        break;
    }
  }

  void _logout() async {
    emit(SettingState(settingsStatus: Status.loading));
    var useCaseResult = await _logoutUseCase.call();
    switch (useCaseResult) {
      case Success<LogoutAndDeleteEntity>():
        emit(SettingState(
            settingsStatus: Status.success, successType: SuccessType.logout));
      case Error<LogoutAndDeleteEntity>():
        emit(SettingState(
            settingsStatus: Status.error, error: useCaseResult.error));
    }
  }

  void _deleteAccount() async {
    emit(SettingState(settingsStatus: Status.loading));
    var useCaseResult = await _deleteAccountUseCase();
    switch (useCaseResult) {
      case Success<LogoutAndDeleteEntity>():
        emit(SettingState(
            settingsStatus: Status.success, successType: SuccessType.deleting));
      case Error<LogoutAndDeleteEntity>():
        emit(SettingState(
            settingsStatus: Status.error, error: useCaseResult.error));
    }
  }
}
