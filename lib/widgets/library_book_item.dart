import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:library_books_repository/library_books_repository.dart';

class LibraryBookItem extends StatelessWidget {
  final LibraryBook libraryBook;

  LibraryBookItem({
    Key key,
    @required this.libraryBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(libraryBook.pictureURL),
        title: Text(libraryBook.name),
        subtitle: Text(libraryBook.isbn));
  }
}
