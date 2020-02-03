import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../user_matches_repository.dart';
import 'entities/entities.dart';

class FirebaseUserMatchesRepository implements UserMatchesRepository {
  final userMatchCollection = Firestore.instance.collection('userMatches');

  @override
  Future<void> addNewUserMatch(UserMatch userMatch) {
    return userMatchCollection.add(userMatch.toEntity().toDocument());
  }

  @override
  Future<void> deleteUserMatch(UserMatch userMatch) async {
    return userMatchCollection.document(userMatch.id).delete();
  }

  @override
  Stream<List<UserMatch>> userMatches(String user) {
    return userMatchCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) =>
              UserMatch.fromEntity(UserMatchEntity.fromSnapshot(doc)))
          .toList()
          .where((userMatch) {
        return userMatch.userThatWillStay == user || userMatch.userThatWillTravel == user;
      }).toList();
    });
  }

  @override
  Future<void> updateUserMatch(UserMatch update) {
    return userMatchCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}
