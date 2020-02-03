import 'package:equatable/equatable.dart';
import 'package:user_matches_repository/user_matches_repository.dart';

abstract class UserMatchesState extends Equatable {
  const UserMatchesState();

  @override
  List<Object> get props => [];
}

class UserMatchesLoading extends UserMatchesState {}

class UserMatchesLoaded extends UserMatchesState {
  final List<UserMatch> userMatches;

  const UserMatchesLoaded([this.userMatches = const []]);

  @override
  List<Object> get props => [userMatches];

  @override
  String toString() => 'UserMatchesLoaded { userMatches: $userMatches }';
}

class UserMatchesNotLoaded extends UserMatchesState {}
