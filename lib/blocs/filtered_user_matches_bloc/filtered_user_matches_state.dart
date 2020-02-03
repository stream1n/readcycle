import 'package:equatable/equatable.dart';

import 'package:user_matches_repository/user_matches_repository.dart';
import 'package:readcycle/models/models.dart';

abstract class FilteredUserMatchesState extends Equatable {
  const FilteredUserMatchesState();

  @override
  List<Object> get props => [];
}

class FilteredUserMatchesLoading extends FilteredUserMatchesState {}

class FilteredUserMatchesLoaded extends FilteredUserMatchesState {
  final List<UserMatch> filteredUserMatches;
  final VisibilityFilter activeFilter;

  const FilteredUserMatchesLoaded(
    this.filteredUserMatches,
    this.activeFilter,
  );

  @override
  List<Object> get props => [filteredUserMatches, activeFilter];

  @override
  String toString() {
    return 'FilteredUserMatchesLoaded { filteredUserMatches: $filteredUserMatches, activeFilter: $activeFilter }';
  }
}
