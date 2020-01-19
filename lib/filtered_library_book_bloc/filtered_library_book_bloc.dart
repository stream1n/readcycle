import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readcycle/filtered_library_book_bloc/blocs.dart';
import 'package:readcycle/library_book_bloc/blocs.dart';
import 'package:readcycle/models/models.dart';

class FilteredLibraryBooksBloc extends Bloc<FilteredLibraryBooksEvent, FilteredLibraryBooksState> {
  final LibraryBookBloc _libraryBooksBloc;
  StreamSubscription _libraryBooksSubscription;

  FilteredLibraryBooksBloc({@required LibraryBookBloc libraryBooksBloc})
      : assert(libraryBooksBloc != null),
        _libraryBooksBloc = libraryBooksBloc {
    _libraryBooksSubscription = libraryBooksBloc.listen((state) {
      if (state is LibraryBooksLoaded) {
        add(UpdateLibraryBooks((libraryBooksBloc.state as LibraryBooksLoaded).libraryBooks));
      }
    });
  }

  @override
  FilteredLibraryBooksState get initialState {
    final currentState = _libraryBooksBloc.state;
    return currentState is LibraryBooksLoaded
        ? FilteredLibraryBooksLoaded(currentState.libraryBooks, VisibilityFilter.all)
        : FilteredLibraryBooksLoading();
  }

  @override
  Stream<FilteredLibraryBooksState> mapEventToState(FilteredLibraryBooksEvent event) async* {
    if (event is UpdateFilter) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is UpdateLibraryBooks) {
      yield* _mapLibraryBooksUpdatedToState(event);
    }
  }

  Stream<FilteredLibraryBooksState> _mapUpdateFilterToState(
      UpdateFilter event,
      ) async* {
    final currentState = _libraryBooksBloc.state;
    if (currentState is LibraryBooksLoaded) {
      yield FilteredLibraryBooksLoaded(
        _mapLibraryBooksToFilteredLibraryBooks(currentState.libraryBooks, event.filter),
        event.filter,
      );
    }
  }

  Stream<FilteredLibraryBooksState> _mapLibraryBooksUpdatedToState(
      UpdateLibraryBooks event,
      ) async* {
    final visibilityFilter = state is FilteredLibraryBooksLoaded
        ? (state as FilteredLibraryBooksLoaded).activeFilter
        : VisibilityFilter.all;
    yield FilteredLibraryBooksLoaded(
      _mapLibraryBooksToFilteredLibraryBooks(
        (_libraryBooksBloc.state as LibraryBooksLoaded).libraryBooks,
        visibilityFilter,
      ),
      visibilityFilter,
    );
  }

  List<LibraryBook> _mapLibraryBooksToFilteredLibraryBooks(
      List<LibraryBook> libraryBooks, VisibilityFilter filter) {
    return libraryBooks.where((libraryBook) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.mine) {
        return !libraryBook.wanted;
      } else {
        return libraryBook.wanted;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    _libraryBooksSubscription?.cancel();
    return super.close();
  }
}