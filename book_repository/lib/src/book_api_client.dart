import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'models/models.dart';

class BookApiClient {
  static const baseUrl = 'https://books.streamin.ai/search';
  final http.Client httpClient;

  BookApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<Book> fetchBookByISBN(String isbn) async {
    final bookUrl = '$baseUrl/isbn?isbn=$isbn';
    final bookResponse = await this.httpClient.get(bookUrl);

    if (bookResponse.statusCode != 200) {
      throw Exception('Could not find your book');
    }

    final bookJson = jsonDecode(bookResponse.body);

    final totalItems = bookJson['totalItems'];

    if (totalItems < 1) {
      throw Exception('Could not find your book');
    }

    final book = bookJson['items'][0]; // We can assume only 1 book per ISBN

    return Book.fromJson(book);
  }

  Future<List<Book>> fetchBooksByAuthor(String author) async {
    final bookUrl = '$baseUrl/author?author=$author';
    final bookResponse = await this.httpClient.get(bookUrl);

    if (bookResponse.statusCode != 200) {
      throw Exception('Could not find your books');
    }

    final bookJson = jsonDecode(bookResponse.body);

    final totalItems = bookJson['totalItems'];

    if (totalItems < 1) {
      throw Exception('Could not find your books');
    }

    final books = bookJson['items'] as List;
    final retBooks = books.map((i) => Book.fromJson(i)).toList();
    return retBooks;

  }

  Future<List<Book>> fetchBooksByTitle(String title) async {
    final bookUrl = '$baseUrl/title?title=$title';
    final bookResponse = await this.httpClient.get(bookUrl);

    if (bookResponse.statusCode != 200) {
      throw Exception('Could not find your books');
    }

    final bookJson = jsonDecode(bookResponse.body);

    final totalItems = bookJson['totalItems'];

    if (totalItems < 1) {
      throw Exception('Could not find your books');
    }

    final books = bookJson['items'] as List;

    return books.map((i) => Book.fromJson(i)).toList();

  }
}
