import 'dart:async';

import '../user_profile_repository.dart';

abstract class UserProfileRepository {
  Future<void> addNewUserProfile(UserProfile userProfile);

  Future<void> deleteUserProfile(UserProfile userProfile);

  Future<UserProfile> getUserProfile(String id);

  Future<void> updateUserProfile(UserProfile userProfile);
}
