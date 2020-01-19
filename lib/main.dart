import 'package:readcycle/filtered_library_book_bloc/blocs.dart';
import 'package:readcycle/library_book_bloc/blocs.dart';
import 'package:readcycle/main_route.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_bloc/bloc.dart';
import 'repositories/user_repository.dart';
import 'login/login.dart';
import 'splash_screen.dart';
import 'simple_bloc_delegate.dart';
import 'package:http/http.dart' as http;
import './repositories/repositories.dart';
import './book_bloc/book_bloc.dart';
import './books_bloc/books_bloc.dart';

void main() {

  final UserRepository userRepository = UserRepository();

  final BookRepository bookRepository = BookRepository(
    bookApiClient: BookApiClient(
      httpClient: http.Client(),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(userRepository: userRepository)..add(AppStarted())
          ),
          BlocProvider<BookBloc>(
              create: (context) => BookBloc(bookRepository: bookRepository)
          ),
          BlocProvider<BooksBloc>(
              create: (context) => BooksBloc(bookRepository: bookRepository)
          ),
          BlocProvider<LibraryBookBloc>(
              create: (context) => LibraryBookBloc(libraryBookRepository: FirebaseLibraryBookRepository())
          ),
          BlocProvider<FilteredLibraryBooksBloc>(
            create: (context) => FilteredLibraryBooksBloc(
              libraryBooksBloc: BlocProvider.of<LibraryBookBloc>(context),
            ),
          ),
        ],
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return MainRoute(user: state.user);
          }
          return SplashScreen();
        },
      ),
    );
  }
}
