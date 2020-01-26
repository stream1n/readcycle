import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../user_location_repository.dart';
import 'entities/entities.dart';

class FirebaseUserLocationRepository implements UserLocationRepository {
  final userLocationCollection = Firestore.instance.collection('userLocations');

  @override
  Future<void> addNewUserLocation(UserLocation userLocation) {
    return userLocationCollection.document(userLocation.id).setData(userLocation.toEntity().toDocument());
  }

  @override
  Future<void> deleteUserLocation(UserLocation userLocation) async {
    return userLocationCollection.document(userLocation.id).delete();
  }

  @override
  Future<UserLocation> getUserLocation(String id) async {
    var doc = await userLocationCollection.document(id).get();
    return UserLocation.fromEntity(UserLocationEntity.fromSnapshot(doc));
  }

  @override
  Future<bool> doesUserLocationExist(String id) async {
    var doc = await userLocationCollection.document(id).get();
    return doc.exists;
  }

  @override
  Future<void> updateUserLocation(UserLocation update) {
    return userLocationCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}
