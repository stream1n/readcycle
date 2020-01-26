import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:user_profile_repository/user_profile_repository.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final String _userId;
  final UserProfileRepository _userProfileRepository;

  UserProfileBloc({@required UserProfileRepository userProfileRepository, @required String userId})
      : assert(userProfileRepository != null && userId != null),
        _userProfileRepository = userProfileRepository,
        _userId = userId;

  @override
  UserProfileState get initialState => UserProfileLoading();

  @override
  Stream<UserProfileState> mapEventToState(UserProfileEvent event) async* {
    if (event is LoadUserProfile) {
      yield* _mapLoadUserProfileToState();
    } else if (event is AddUserProfile) {
      yield* _mapAddUserProfileToState(event);
    } else if (event is UpdateUserProfile) {
      yield* _mapUpdateUserProfileToState(event);
    } else if (event is DeleteUserProfile) {
      yield* _mapDeleteUserProfileToState(event);
    }
  }

  Stream<UserProfileState> _mapLoadUserProfileToState() async* {

    yield UserProfileLoading();
    try {
      final UserProfile userProfile = await _userProfileRepository.getUserProfile(_userId);
      yield UserProfileLoaded(userProfile);
    } catch (_) {
      yield UserProfileNotLoaded();
    }

  }

  Stream<UserProfileState> _mapAddUserProfileToState(AddUserProfile event) async* {
    _userProfileRepository.addNewUserProfile(event.userProfile);
  }

  Stream<UserProfileState> _mapUpdateUserProfileToState(UpdateUserProfile event) async* {
    _userProfileRepository.updateUserProfile(event.updatedUserProfile);
  }

  Stream<UserProfileState> _mapDeleteUserProfileToState(DeleteUserProfile event) async* {
    _userProfileRepository.deleteUserProfile(event.userProfile);
  }

}
