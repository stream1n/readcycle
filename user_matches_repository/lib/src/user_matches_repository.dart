import 'dart:async';

import '../user_matches_repository.dart';

abstract class UserMatchesRepository {
  Future<void> addNewUserMatch(UserMatch userMatch);

  Future<void> deleteUserMatch(UserMatch userMatch);

  Stream<List<UserMatch>> userMatches(String user);

  Future<void> updateUserMatch(UserMatch userMatch);
}
