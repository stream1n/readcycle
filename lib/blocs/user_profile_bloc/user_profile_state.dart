import 'package:equatable/equatable.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final UserProfile userProfile;

  const UserProfileLoaded(this.userProfile);

  @override
  List<Object> get props => [userProfile];

  @override
  String toString() => 'UserProfileLoaded { userProfile: $userProfile }';
}

class UserProfileNotLoaded extends UserProfileState {}
