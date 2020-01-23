import 'models/models.dart';

abstract class BookRepository {

  Future<Book> getBookByISBN(String isbn);

  Future<List<Book>> getBooksByAuthor(String author);

  Future<List<Book>> getBooksByTitle(String title);

}
