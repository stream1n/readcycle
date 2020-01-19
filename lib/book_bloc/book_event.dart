import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class FetchBookByISBN extends BookEvent {
  final String isbn;

  const FetchBookByISBN({@required this.isbn}) : assert(isbn != null);

  @override
  List<Object> get props => [isbn];
}