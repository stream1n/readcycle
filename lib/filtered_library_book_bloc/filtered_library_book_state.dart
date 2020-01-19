import 'package:equatable/equatable.dart';
import 'package:readcycle/models/models.dart';

abstract class FilteredLibraryBooksState extends Equatable {
  const FilteredLibraryBooksState();

  @override
  List<Object> get props => [];
}

class FilteredLibraryBooksLoading extends FilteredLibraryBooksState {}

class FilteredLibraryBooksLoaded extends FilteredLibraryBooksState {
  final List<LibraryBook> filteredLibraryBooks;
  final VisibilityFilter activeFilter;

  const FilteredLibraryBooksLoaded(
      this.filteredLibraryBooks,
      this.activeFilter,
      );

  @override
  List<Object> get props => [filteredLibraryBooks, activeFilter];

  @override
  String toString() {
    return 'FilteredLibraryBooksLoaded { filteredLibraryBooks: $filteredLibraryBooks, activeFilter: $activeFilter }';
  }
}