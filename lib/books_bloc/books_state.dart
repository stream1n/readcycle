import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:readcycle/models/models.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksEmpty extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<Book> books;

  const BooksLoaded({@required this.books}) : assert(books != null);

  @override
  List<Object> get props => [books];
}

class BooksError extends BooksState {}