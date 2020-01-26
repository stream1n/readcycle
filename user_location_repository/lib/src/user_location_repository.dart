import 'dart:async';

import '../user_location_repository.dart';

abstract class UserLocationRepository {
  Future<void> addNewUserLocation(UserLocation userLocation);

  Future<void> deleteUserLocation(UserLocation userLocation);

  Future<UserLocation> getUserLocation(String id);

  Future<bool> doesUserLocationExist(String id);

  Future<void> updateUserLocation(UserLocation userLocation);
}
