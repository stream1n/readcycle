import 'dart:async';

import 'package:meta/meta.dart';

import './book_api_client.dart';
import '../models/models.dart';

class BookRepository {
  final BookApiClient bookApiClient;

  BookRepository({@required this.bookApiClient})
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
