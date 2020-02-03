import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readcycle/blocs/user_matches/user_matches.dart';
import 'package:user_matches_repository/user_matches_repository.dart';

class UserMatchesBloc extends Bloc<UserMatchesEvent, UserMatchesState> {
  final String _userId;
  final UserMatchesRepository _userMatchesRepository;
  StreamSubscription _userMatchesSubscription;

  UserMatchesBloc({@required UserMatchesRepository userMatchesRepository, @required String userId})
      : assert(userMatchesRepository != null && userId != null),
        _userMatchesRepository = userMatchesRepository,
        _userId = userId;

  @override
  UserMatchesState get initialState => UserMatchesLoading();

  @override
  Stream<UserMatchesState> mapEventToState(UserMatchesEvent event) async* {
    if (event is LoadUserMatches) {
      yield* _mapLoadUserMatchesToState();
    } else if (event is AddUserMatch) {
      yield* _mapAddUserMatchToState(event);
    } else if (event is UpdateUserMatch) {
      yield* _mapUpdateUserMatchToState(event);
    } else if (event is DeleteUserMatch) {
      yield* _mapDeleteUserMatchToState(event);
    } else if (event is UserMatchesUpdated) {
      yield* _mapUserMatchesUpdateToState(event);
    }
  }

  Stream<UserMatchesState> _mapLoadUserMatchesToState() async* {
    _userMatchesSubscription?.cancel();
    _userMatchesSubscription = _userMatchesRepository.userMatches(_userId).listen(
          (libraryBooks) => add(UserMatchesUpdated(libraryBooks)),
        );
  }

  Stream<UserMatchesState> _mapAddUserMatchToState(AddUserMatch event) async* {
    _userMatchesRepository.addNewUserMatch(event.userMatch);
  }

  Stream<UserMatchesState> _mapUpdateUserMatchToState(UpdateUserMatch event) async* {
    _userMatchesRepository.updateUserMatch(event.updatedUserMatch);
  }

  Stream<UserMatchesState> _mapDeleteUserMatchToState(DeleteUserMatch event) async* {
    _userMatchesRepository.deleteUserMatch(event.userMatch);
  }

  Stream<UserMatchesState> _mapUserMatchesUpdateToState(UserMatchesUpdated event) async* {
    yield UserMatchesLoaded(event.userMatches);
  }

  @override
  Future<void> close() {
    _userMatchesSubscription?.cancel();
    return super.close();
  }
}
