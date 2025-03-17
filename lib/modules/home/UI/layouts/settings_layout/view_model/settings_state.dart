import 'package:equatable/equatable.dart';

enum Status { idle, loading, success, error }

enum SuccessType { logout, deleting }

class SettingState extends Equatable {
  Status settingsStatus;

  SuccessType? successType;
  Object? error;

  SettingState(
      {this.settingsStatus = Status.idle, this.successType, this.error});

  @override
  List<Object?> get props => [settingsStatus];
}
