import 'package:equatable/equatable.dart';
import 'package:user_matches_repository/user_matches_repository.dart';
import 'package:readcycle/models/models.dart';

abstract class FilteredUserMatchesEvent extends Equatable {
  const FilteredUserMatchesEvent();
}

class UpdateUserMatchesFilter extends FilteredUserMatchesEvent {
  final VisibilityFilter filter;

  const UpdateUserMatchesFilter(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'UpdateUserMatchesFilter { filter: $filter }';
}

class UpdateUserMatches extends FilteredUserMatchesEvent {
  final List<UserMatch> userMatches;

  const UpdateUserMatches(this.userMatches);

  @override
  List<Object> get props => [userMatches];

  @override
  String toString() => 'UpdateUserMatches { userMatches: $userMatches }';
}
