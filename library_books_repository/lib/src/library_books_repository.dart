import 'dart:async';

import '../library_books_repository.dart';

abstract class LibraryBooksRepository {
  Future<void> addNewLibraryBook(LibraryBook libraryBook);

  Future<void> deleteLibraryBook(LibraryBook libraryBook);

  Stream<List<LibraryBook>> libraryBooks();

  Future<void> updateLibraryBook(LibraryBook libraryBook);
}
