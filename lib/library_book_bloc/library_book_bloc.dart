import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readcycle/library_book_bloc/blocs.dart';
import 'package:readcycle/repositories/repositories.dart';


class LibraryBookBloc extends Bloc<LibraryBookEvent, LibraryBookState> {
  final LibraryBookRepository _libraryBookRepository;
  StreamSubscription _libraryBooksSubscription;

  LibraryBookBloc({@required LibraryBookRepository libraryBookRepository})
      : assert(libraryBookRepository != null),
        _libraryBookRepository = libraryBookRepository;

  @override
  LibraryBookState get initialState => LibraryBooksLoading();

  @override
  Stream<LibraryBookState> mapEventToState(LibraryBookEvent event) async* {
    if (event is LoadLibraryBooks) {
      yield* _mapLoadLibraryBooksToState();
    } else if (event is AddLibraryBook) {
      yield* _mapAddLibraryBookToState(event);
    } else if (event is LibraryBooksUpdated) {
      yield* _mapLibraryBooksUpdateToState(event);
    }
  }

  Stream<LibraryBookState> _mapLoadLibraryBooksToState() async* {
    _libraryBooksSubscription?.cancel();
    _libraryBooksSubscription = _libraryBookRepository.libraryBooks().listen(
          (libraryBooks) => add(LibraryBooksUpdated(libraryBooks)),
    );
  }

  Stream<LibraryBookState> _mapAddLibraryBookToState(AddLibraryBook event) async* {
    _libraryBookRepository.addNewLibraryBook(event.libraryBook);
  }

  Stream<LibraryBookState> _mapLibraryBooksUpdateToState(LibraryBooksUpdated event) async* {
    yield LibraryBooksLoaded(event.libraryBooks);
  }

  @override
  Future<void> close() {
    _libraryBooksSubscription?.cancel();
    return super.close();
  }
}
