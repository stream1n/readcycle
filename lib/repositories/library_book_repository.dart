import 'dart:async';

import 'package:readcycle/models/models.dart';

abstract class LibraryBookRepository {
  Future<void> addNewLibraryBook(LibraryBook libraryBook);
  Stream<List<LibraryBook>> libraryBooks();
}