import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/blocs/authentication_bloc/bloc.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:readcycle/screens/screens.dart';
import 'package:user_repository/user_repository.dart';
import 'package:library_books_repository/library_books_repository.dart';
import 'package:book_repository/book_repository.dart';
import 'package:http/http.dart' as http;

void main() {
  final UserRepository userRepository = FirebaseUserRepository();

  final BookRepository bookRepository = BookRepositoryHttp(
    bookApiClient: BookApiClient(
      httpClient: http.Client(),
    ),
  );

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
      TodosApp(userRepository: userRepository, bookRepository: bookRepository));
}

class TodosApp extends StatelessWidget {
  final UserRepository _userRepository;
  final BookRepository _bookRepository;

  TodosApp(
      {Key key,
      @required UserRepository userRepository,
      @required BookRepository bookRepository})
      : assert(userRepository != null && bookRepository != null),
        _userRepository = userRepository,
        _bookRepository = bookRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: _userRepository,
            )..add(AppStarted());
          },
        ),
        BlocProvider<LibraryBooksBloc>(
          create: (context) {
            return LibraryBooksBloc(
              libraryBooksRepository: FirebaseLibraryBooksRepository(),
            )..add(LoadLibraryBooks());
          },
        ),
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Unauthenticated) {
              return LoginScreen(userRepository: _userRepository);
            }
            if (state is Authenticated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<BookBloc>(
                      create: (context) =>
                          BookBloc(bookRepository: _bookRepository)),
                  BlocProvider<BooksBloc>(
                      create: (context) =>
                          BooksBloc(bookRepository: _bookRepository)),
                  BlocProvider<FilteredLibraryBooksBloc>(
                    create: (context) => FilteredLibraryBooksBloc(
                      libraryBooksBloc:
                          BlocProvider.of<LibraryBooksBloc>(context),
                    ),
                  ),
                ],
                child: MainRoute(user: state.user),
              );
            }
            return SplashScreen();
          },
        ),
      ),
    );
  }
}
