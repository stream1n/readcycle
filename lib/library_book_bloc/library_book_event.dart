import 'package:equatable/equatable.dart';
import 'package:readcycle/models/models.dart';

abstract class LibraryBookEvent extends Equatable {
  const LibraryBookEvent();

  @override
  List<Object> get props => [];
}

class LoadLibraryBooks extends LibraryBookEvent {}

class AddLibraryBook extends LibraryBookEvent {
  final LibraryBook libraryBook;

  const AddLibraryBook(this.libraryBook);

  @override
  List<Object> get props => [libraryBook];

  @override
  String toString() => 'AddLibraryBook { libraryBook: $libraryBook }';
}

class LibraryBooksUpdated extends LibraryBookEvent {
  final List<LibraryBook> libraryBooks;

  const LibraryBooksUpdated(this.libraryBooks);

  @override
  List<Object> get props => [libraryBooks];
}