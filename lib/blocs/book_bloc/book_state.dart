import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:book_repository/book_repository.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookEmpty extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final Book book;

  const BookLoaded({@required this.book}) : assert(book != null);

  @override
  List<Object> get props => [book];
}

class BookError extends BookState {}