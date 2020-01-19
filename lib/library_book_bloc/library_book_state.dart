import 'package:equatable/equatable.dart';
import 'package:readcycle/models/models.dart';

abstract class LibraryBookState extends Equatable {
  const LibraryBookState();

  @override
  List<Object> get props => [];
}

class LibraryBooksLoading extends LibraryBookState {}

class LibraryBooksLoaded extends LibraryBookState {
  final List<LibraryBook> libraryBooks;

  const LibraryBooksLoaded([this.libraryBooks = const []]);

  @override
  List<Object> get props => [libraryBooks];

  @override
  String toString() => 'LibraryBooksLoaded { libraryBook: $libraryBooks }';
}

class LibraryBooksNotLoaded extends LibraryBookState {}