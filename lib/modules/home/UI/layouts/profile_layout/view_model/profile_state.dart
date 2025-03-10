import 'dart:typed_data';

import 'package:equatable/equatable.dart';

enum ProfileStatus { idle, loading, success, error }

class ProfileState extends Equatable {
  ProfileStatus profileStatus;

  //LoggedUserInfoEntity? loggedUserInfoEntity;
  Object? error;
  Uint8List? image;

  ProfileState(
      {this.profileStatus = ProfileStatus.idle,
      // this.loggedUserInfoEntity,
      this.error,
      this.image});

  @override
  List<Object?> get props => [profileStatus, error, image];

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    Object? error,
    Uint8List? image,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      error: error ?? this.error,
      image: image ?? this.image,
    );
  }
}
