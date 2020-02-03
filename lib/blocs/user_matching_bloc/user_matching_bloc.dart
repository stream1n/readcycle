import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:readcycle/blocs/user_matching_bloc/bloc.dart';
import 'package:user_matching_repository/user_matching_repository.dart';

class UserMatchingBloc extends Bloc<UserMatchingEvent, UserMatchingState> {
  final UserMatchingRepository userMatchingRepository;

  UserMatchingBloc({@required this.userMatchingRepository}) : assert(userMatchingRepository != null);

  @override
  UserMatchingState get initialState => UserMatchingEmpty();

  @override
  Stream<UserMatchingState> mapEventToState(UserMatchingEvent event) async* {
    if (event is accept) {
      yield* _mapAcceptToState(event);
    } else if (event is reject) {
      yield* _mapRejectToState(event);
    } else if (event is cancel) {
      yield* _mapCancelToState(event);
    }
  }

  Stream<UserMatchingState> _mapAcceptToState(accept event) async* {
    yield UserMatchingLoading();
    try {
      await userMatchingRepository.accept(event.userMatchID);
      yield UserMatchingLoaded();
    } catch (_) {
      yield UserMatchingError();
    }
  }

  Stream<UserMatchingState> _mapRejectToState(reject event) async* {
    yield UserMatchingLoading();
    try {
      await userMatchingRepository.reject(event.userMatchID);
      yield UserMatchingLoaded();
    } catch (_) {
      yield UserMatchingError();
    }
  }

  Stream<UserMatchingState> _mapCancelToState(cancel event) async* {
    yield UserMatchingLoading();
    try {
      await userMatchingRepository.cancel(event.userMatchID);
      yield UserMatchingLoaded();
    } catch (_) {
      yield UserMatchingError();
    }
  }

}
