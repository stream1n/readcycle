import 'package:equatable/equatable.dart';
import 'package:library_books_repository/library_books_repository.dart';

abstract class LibraryBooksState extends Equatable {
  const LibraryBooksState();

  @override
  List<Object> get props => [];
}

class LibraryBooksLoading extends LibraryBooksState {}

class LibraryBooksLoaded extends LibraryBooksState {
  final List<LibraryBook> libraryBooks;

  const LibraryBooksLoaded([this.libraryBooks = const []]);

  @override
  List<Object> get props => [libraryBooks];

  @override
  String toString() => 'LibraryBooksLoaded { libraryBooks: $libraryBooks }';
}

class LibraryBooksNotLoaded extends LibraryBooksState {}
