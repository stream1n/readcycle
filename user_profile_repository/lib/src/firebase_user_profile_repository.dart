import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../user_profile_repository.dart';
import 'entities/entities.dart';

class FirebaseUserProfileRepository implements UserProfileRepository {
  final userProfileCollection = Firestore.instance.collection('userProfiles');

  @override
  Future<void> addNewUserProfile(UserProfile userProfile) {
    return userProfileCollection.document(userProfile.id).setData(userProfile.toEntity().toDocument());
  }

  @override
  Future<void> deleteUserProfile(UserProfile userProfile) async {
    return userProfileCollection.document(userProfile.id).delete();
  }

  @override
  Future<UserProfile> getUserProfile(String id) async {
    var doc = await userProfileCollection.document(id).get();
    return UserProfile.fromEntity(UserProfileEntity.fromSnapshot(doc));
  }

  @override
  Future<void> updateUserProfile(UserProfile update) {
    return userProfileCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}
