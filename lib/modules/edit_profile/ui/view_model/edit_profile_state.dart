import 'package:equatable/equatable.dart';

enum EditStatus { idle, loading, success, error }

enum EditFormStatus { valid, unValid }

class EditProfileState extends Equatable {
  EditStatus editProfileState;
  Object? error;
  EditFormStatus editFormStatus;

  EditProfileState(
      {this.editProfileState = EditStatus.idle,
      this.editFormStatus = EditFormStatus.valid,
      this.error});

  EditProfileState copyWith(
      {EditStatus? editProfileState,
      EditFormStatus? editFormStatus,
      Object? error}) {
    return EditProfileState(
        editProfileState: editProfileState ?? this.editProfileState,
        editFormStatus: editFormStatus ?? this.editFormStatus,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [editProfileState, editFormStatus, error];
}
