import 'dart:async';

import 'package:meta/meta.dart';
import './book_api_client.dart';
import 'book_repository.dart';
import 'models/models.dart';

class BookRepositoryHttp implements BookRepository{
  final BookApiClient bookApiClient;

  BookRepositoryHttp({@required this.bookApiClient})
      : assert(bookApiClient != null);

  Future<Book> getBookByISBN(String isbn) async {
    return await bookApiClient.fetchBookByISBN(isbn);
  }

  Future<List<Book>> getBooksByAuthor(String author) async {
    return await bookApiClient.fetchBooksByAuthor(author);
  }

  Future<List<Book>> getBooksByTitle(String title) async {
    return await bookApiClient.fetchBooksByTitle(title);
  }

}
