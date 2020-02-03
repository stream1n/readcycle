import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_matches_repository/user_matches_repository.dart';
import 'package:readcycle/blocs/filtered_user_matches_bloc/filtered_user_matches.dart';
import 'package:readcycle/blocs/user_matches/user_matches.dart';
import 'package:readcycle/models/models.dart';

class FilteredUserMatchesBloc extends Bloc<FilteredUserMatchesEvent, FilteredUserMatchesState> {
  final String _userId;
  final UserMatchesBloc _userMatchesBloc;
  StreamSubscription _userMatchesSubscription;

  FilteredUserMatchesBloc({@required UserMatchesBloc userMatchesBloc, @required String userId})
      : assert(userMatchesBloc != null && userId != null),
        _userId = userId,
        _userMatchesBloc = userMatchesBloc {
    _userMatchesSubscription = userMatchesBloc.listen((state) {
      if (state is UserMatchesLoaded) {
        add(UpdateUserMatches((userMatchesBloc.state as UserMatchesLoaded).userMatches));
      }
    });
  }

  @override
  FilteredUserMatchesState get initialState {
    final currentState = _userMatchesBloc.state;
    return currentState is UserMatchesLoaded
        ? FilteredUserMatchesLoaded(currentState.userMatches, VisibilityFilter.all)
        : FilteredUserMatchesLoading();
  }

  @override
  Stream<FilteredUserMatchesState> mapEventToState(FilteredUserMatchesEvent event) async* {
    if (event is UpdateUserMatchesFilter) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is UpdateUserMatches) {
      yield* _mapUserMatchesUpdatedToState(event);
    }
  }

  Stream<FilteredUserMatchesState> _mapUpdateFilterToState(
      UpdateUserMatchesFilter event,
  ) async* {
    final currentState = _userMatchesBloc.state;
    if (currentState is UserMatchesLoaded) {
      yield FilteredUserMatchesLoaded(
        _mapUserMatchesToFilteredUserMatches(currentState.userMatches, event.filter),
        event.filter,
      );
    }
  }

  Stream<FilteredUserMatchesState> _mapUserMatchesUpdatedToState(
    UpdateUserMatches event,
  ) async* {
    final visibilityFilter = state is FilteredUserMatchesLoaded
        ? (state as FilteredUserMatchesLoaded).activeFilter
        : VisibilityFilter.all;
    yield FilteredUserMatchesLoaded(
      _mapUserMatchesToFilteredUserMatches(
        (_userMatchesBloc.state as UserMatchesLoaded).userMatches,
        visibilityFilter,
      ),
      visibilityFilter,
    );
  }

  List<UserMatch> _mapUserMatchesToFilteredUserMatches(
      List<UserMatch> userMatches, VisibilityFilter filter) {
    return userMatches.where((userMatch) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.mine) {
        return userMatch.userThatWillStay == _userId;
      } else {
        return userMatch.userThatWillTravel == _userId;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    _userMatchesSubscription?.cancel();
    return super.close();
  }
}
