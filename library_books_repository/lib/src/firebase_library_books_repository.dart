import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../library_books_repository.dart';
import 'entities/entities.dart';

class FirebaseLibraryBooksRepository implements LibraryBooksRepository {
  final libraryBookCollection = Firestore.instance.collection('libraryBooks');

  @override
  Future<void> addNewLibraryBook(LibraryBook libraryBook) {
    return libraryBookCollection.add(libraryBook.toEntity().toDocument());
  }

  @override
  Future<void> deleteLibraryBook(LibraryBook libraryBook) async {
    return libraryBookCollection.document(libraryBook.id).delete();
  }

  @override
  Stream<List<LibraryBook>> libraryBooks(String user) {
    return libraryBookCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) =>
              LibraryBook.fromEntity(LibraryBookEntity.fromSnapshot(doc)))
          .toList()
          .where((libraryBook) {
        return libraryBook.user == user;
      }).toList();
    });
  }

  @override
  Future<void> updateLibraryBook(LibraryBook update) {
    return libraryBookCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}
