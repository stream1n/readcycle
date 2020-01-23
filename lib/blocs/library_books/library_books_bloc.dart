import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readcycle/blocs/library_books/library_books.dart';
import 'package:library_books_repository/library_books_repository.dart';

class LibraryBooksBloc extends Bloc<LibraryBooksEvent, LibraryBooksState> {
  final LibraryBooksRepository _libraryBooksRepository;
  StreamSubscription _libraryBooksSubscription;

  LibraryBooksBloc({@required LibraryBooksRepository libraryBooksRepository})
      : assert(libraryBooksRepository != null),
        _libraryBooksRepository = libraryBooksRepository;

  @override
  LibraryBooksState get initialState => LibraryBooksLoading();

  @override
  Stream<LibraryBooksState> mapEventToState(LibraryBooksEvent event) async* {
    if (event is LoadLibraryBooks) {
      yield* _mapLoadLibraryBooksToState();
    } else if (event is AddLibraryBook) {
      yield* _mapAddLibraryBookToState(event);
    } else if (event is UpdateLibraryBook) {
      yield* _mapUpdateLibraryBookToState(event);
    } else if (event is DeleteLibraryBook) {
      yield* _mapDeleteLibraryBookToState(event);
    } else if (event is LibraryBooksUpdated) {
      yield* _mapLibraryBooksUpdateToState(event);
    }
  }

  Stream<LibraryBooksState> _mapLoadLibraryBooksToState() async* {
    _libraryBooksSubscription?.cancel();
    _libraryBooksSubscription = _libraryBooksRepository.libraryBooks().listen(
          (libraryBooks) => add(LibraryBooksUpdated(libraryBooks)),
        );
  }

  Stream<LibraryBooksState> _mapAddLibraryBookToState(AddLibraryBook event) async* {
    _libraryBooksRepository.addNewLibraryBook(event.libraryBook);
  }

  Stream<LibraryBooksState> _mapUpdateLibraryBookToState(UpdateLibraryBook event) async* {
    _libraryBooksRepository.updateLibraryBook(event.updatedLibraryBook);
  }

  Stream<LibraryBooksState> _mapDeleteLibraryBookToState(DeleteLibraryBook event) async* {
    _libraryBooksRepository.deleteLibraryBook(event.libraryBook);
  }

  Stream<LibraryBooksState> _mapLibraryBooksUpdateToState(LibraryBooksUpdated event) async* {
    yield LibraryBooksLoaded(event.libraryBooks);
  }

  @override
  Future<void> close() {
    _libraryBooksSubscription?.cancel();
    return super.close();
  }
}
