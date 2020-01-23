import 'package:equatable/equatable.dart';
import 'package:library_books_repository/library_books_repository.dart';

abstract class LibraryBooksEvent extends Equatable {
  const LibraryBooksEvent();

  @override
  List<Object> get props => [];
}

class LoadLibraryBooks extends LibraryBooksEvent {}

class AddLibraryBook extends LibraryBooksEvent {
  final LibraryBook libraryBook;

  const AddLibraryBook(this.libraryBook);

  @override
  List<Object> get props => [libraryBook];

  @override
  String toString() => 'AddLibraryBook { libraryBook: $libraryBook }';
}

class UpdateLibraryBook extends LibraryBooksEvent {
  final LibraryBook updatedLibraryBook;

  const UpdateLibraryBook(this.updatedLibraryBook);

  @override
  List<Object> get props => [updatedLibraryBook];

  @override
  String toString() => 'UpdateLibraryBook { updatedLibraryBook: $updatedLibraryBook }';
}

class DeleteLibraryBook extends LibraryBooksEvent {
  final LibraryBook libraryBook;

  const DeleteLibraryBook(this.libraryBook);

  @override
  List<Object> get props => [libraryBook];

  @override
  String toString() => 'DeleteLibraryBook { libraryBook: $libraryBook }';
}

class LibraryBooksUpdated extends LibraryBooksEvent {
  final List<LibraryBook> libraryBooks;

  const LibraryBooksUpdated(this.libraryBooks);

  @override
  List<Object> get props => [libraryBooks];
}
