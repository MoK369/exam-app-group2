

enum ProfileStatus { idle, loading, success, error }

class ProfileState {
  ProfileStatus profileStatus;

  //LoggedUserInfoEntity? loggedUserInfoEntity;
  Object? error;

  ProfileState(
      {this.profileStatus = ProfileStatus.idle,
      // this.loggedUserInfoEntity,
      this.error});
}
