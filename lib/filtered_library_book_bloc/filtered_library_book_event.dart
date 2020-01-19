import 'package:equatable/equatable.dart';
import 'package:readcycle/models/models.dart';

abstract class FilteredLibraryBooksEvent extends Equatable {
  const FilteredLibraryBooksEvent();
}

class UpdateFilter extends FilteredLibraryBooksEvent {
  final VisibilityFilter filter;

  const UpdateFilter(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'UpdateFilter { filter: $filter }';
}

class UpdateLibraryBooks extends FilteredLibraryBooksEvent {
  final List<LibraryBook> libraryBooks;

  const UpdateLibraryBooks(this.libraryBooks);

  @override
  List<Object> get props => [libraryBooks];

  @override
  String toString() => 'UpdateLibraryBooks { todos: $libraryBooks }';
}