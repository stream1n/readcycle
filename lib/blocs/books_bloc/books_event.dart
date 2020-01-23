import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

class FetchBooksByAuthor extends BooksEvent {
  final String author;

  const FetchBooksByAuthor({@required this.author}) : assert(author != null);

  @override
  List<Object> get props => [author];
}

class FetchBooksByTitle extends BooksEvent {
  final String title;

  const FetchBooksByTitle({@required this.title}) : assert(title != null);

  @override
  List<Object> get props => [title];
}