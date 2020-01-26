import 'package:equatable/equatable.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfile extends UserProfileEvent {}

class AddUserProfile extends UserProfileEvent {
  final UserProfile userProfile;

  const AddUserProfile(this.userProfile);

  @override
  List<Object> get props => [userProfile];

  @override
  String toString() => 'AddUserProfile { userProfile: $userProfile }';
}

class UpdateUserProfile extends UserProfileEvent {
  final UserProfile updatedUserProfile;

  const UpdateUserProfile(this.updatedUserProfile);

  @override
  List<Object> get props => [updatedUserProfile];

  @override
  String toString() => 'UpdateUserProfile { updatedUserProfile: $updatedUserProfile }';
}

class DeleteUserProfile extends UserProfileEvent {
  final UserProfile userProfile;

  const DeleteUserProfile(this.userProfile);

  @override
  List<Object> get props => [userProfile];

  @override
  String toString() => 'DeleteUserProfile { userProfile: $userProfile }';
}

class UserProfileUpdated extends UserProfileEvent {
  final UserProfile userProfile;

  const UserProfileUpdated(this.userProfile);

  @override
  List<Object> get props => [userProfile];
}
