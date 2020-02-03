import 'package:equatable/equatable.dart';
import 'package:user_matches_repository/user_matches_repository.dart';

abstract class UserMatchesEvent extends Equatable {
  const UserMatchesEvent();

  @override
  List<Object> get props => [];
}

class LoadUserMatches extends UserMatchesEvent {}

class AddUserMatch extends UserMatchesEvent {
  final UserMatch userMatch;

  const AddUserMatch(this.userMatch);

  @override
  List<Object> get props => [userMatch];

  @override
  String toString() => 'AddUserMatch { userMatch: $userMatch }';
}

class UpdateUserMatch extends UserMatchesEvent {
  final UserMatch updatedUserMatch;

  const UpdateUserMatch(this.updatedUserMatch);

  @override
  List<Object> get props => [updatedUserMatch];

  @override
  String toString() => 'UpdateUserMatch { updatedUserMatch: $updatedUserMatch }';
}

class DeleteUserMatch extends UserMatchesEvent {
  final UserMatch userMatch;

  const DeleteUserMatch(this.userMatch);

  @override
  List<Object> get props => [userMatch];

  @override
  String toString() => 'DeleteUserMatch { userMatch: $userMatch }';
}

class UserMatchesUpdated extends UserMatchesEvent {
  final List<UserMatch> userMatches;

  const UserMatchesUpdated(this.userMatches);

  @override
  List<Object> get props => [userMatches];
}
