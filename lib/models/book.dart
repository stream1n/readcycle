import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String name;
  final List<String> authors;
  final String pictureURL;
  final String isbn;

  const Book({
    this.name,
    this.authors,
    this.pictureURL,
    this.isbn
  });

  @override
  List<Object> get props =>
      [
        name,
        authors,
        pictureURL,
        isbn
      ];

  static Book fromJson(dynamic book) {
    final authorsFromJson = book['volumeInfo']['authors'];

    return Book(
        name: book['volumeInfo']['title'],
        authors: new List<String>.from(authorsFromJson),
        pictureURL: book['volumeInfo']['imageLinks']['thumbnail'],
        isbn: book['volumeInfo']['industryIdentifiers'][0]['identifier']
    );
  }

}
