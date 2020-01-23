import 'package:book_repository/book_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:readcycle/blocs/books_bloc/bloc.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BookRepository bookRepository;

  BooksBloc({@required this.bookRepository}) : assert(bookRepository != null);

  @override
  BooksState get initialState => BooksEmpty();

  @override
  Stream<BooksState> mapEventToState(BooksEvent event) async* {
    if (event is FetchBooksByAuthor) {
      yield* _mapFetchBooksByAuthorToState(event);
    } else if (event is FetchBooksByTitle) {
      yield* _mapFetchBooksByTitleToState(event);
    }
  }

  Stream<BooksState> _mapFetchBooksByAuthorToState(
      FetchBooksByAuthor event) async* {
    yield BooksLoading();
    try {
      final List<Book> books =
      await bookRepository.getBooksByAuthor(event.author);
      yield BooksLoaded(books: books);
    } catch (_) {
      yield BooksError();
    }
  }

  Stream<BooksState> _mapFetchBooksByTitleToState(
      FetchBooksByTitle event) async* {
    yield BooksLoading();
    try {
      final List<Book> books =
      await bookRepository.getBooksByTitle(event.title);
      yield BooksLoaded(books: books);
    } catch (_) {
      yield BooksError();
    }
  }

}