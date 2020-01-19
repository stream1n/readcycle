import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:readcycle/entities/entities.dart';
import 'package:readcycle/models/models.dart';
import 'package:readcycle/repositories/repositories.dart';

class FirebaseLibraryBookRepository implements LibraryBookRepository {
  final libraryBookCollection = Firestore.instance.collection('libraryBooks');

  @override
  Future<void> addNewLibraryBook(LibraryBook libraryBook) {
    return libraryBookCollection.add(libraryBook.toEntity().toDocument());
  }

  @override
  Stream<List<LibraryBook>> libraryBooks() {
    return libraryBookCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => LibraryBook.fromEntity(LibraryBookEntity.fromSnapshot(doc)))
          .toList();
    });
  }

}
