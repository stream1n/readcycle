import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:readcycle/book_bloc/blocs.dart';
import 'package:readcycle/models/models.dart';
import 'package:readcycle/repositories/repositories.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({@required this.bookRepository}) : assert(bookRepository != null);

  @override
  BookState get initialState => BookEmpty();

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is FetchBookByISBN) {
      yield* _mapFetchBookByISBNToState(event);
    }
  }

  Stream<BookState> _mapFetchBookByISBNToState(FetchBookByISBN event) async* {
    yield BookLoading();
    try {
      final Book book = await bookRepository.getBookByISBN(event.isbn);
      yield BookLoaded(book: book);
    } catch (_) {
      yield BookError();
    }
  }

}
