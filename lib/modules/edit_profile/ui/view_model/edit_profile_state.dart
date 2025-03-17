import 'dart:typed_data';

import 'package:equatable/equatable.dart';

enum EditStatus { idle, loading, success, error }

enum EditFormStatus { valid, unValid }

class EditProfileState extends Equatable {
  EditStatus editProfileState;
  Object? error;
  EditFormStatus editFormStatus;
  Uint8List? avatarImage;

  EditProfileState(
      {this.editProfileState = EditStatus.idle,
      this.editFormStatus = EditFormStatus.valid,
      this.error,
      this.avatarImage});

  EditProfileState copyWith(
      {EditStatus? editProfileState,
      EditFormStatus? editFormStatus,
      Object? error,
      Uint8List? avatarImage}) {
    return EditProfileState(
        editProfileState: editProfileState ?? this.editProfileState,
        editFormStatus: editFormStatus ?? this.editFormStatus,
        error: error ?? this.error,
        avatarImage: avatarImage ?? this.avatarImage);
  }

  @override
  List<Object?> get props =>
      [editProfileState, editFormStatus, error, avatarImage];
}
