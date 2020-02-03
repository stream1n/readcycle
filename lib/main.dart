import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/blocs/authentication_bloc/bloc.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:readcycle/screens/screens.dart';
import 'package:user_matching_repository/user_matching_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:library_books_repository/library_books_repository.dart';
import 'package:user_matches_repository/user_matches_repository.dart';
import 'package:user_location_repository/user_location_repository.dart';
import 'package:book_repository/book_repository.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

void main() {
  final BookRepository bookRepository = BookRepositoryHttp(
    bookApiClient: BookApiClient(
      httpClient: http.Client(),
    ),
  );

  final UserMatchingRepository userMatchingRepository = UserMatchingRepositoryHttp(
    userMatchingApiClient: UserMatchingApiClient(
      httpClient: http.Client(),
    ),
  );

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(ReadCycleApp(bookRepository: bookRepository, userMatchingRepository: userMatchingRepository));
}

class ReadCycleApp extends StatelessWidget {
  final BookRepository _bookRepository;
  final UserMatchingRepository _userMatchingRepository;

  ReadCycleApp({Key key, @required BookRepository bookRepository, @required UserMatchingRepository userMatchingRepository})
      : assert(bookRepository != null && userMatchingRepository != null),
        _bookRepository = bookRepository,
        _userMatchingRepository = userMatchingRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: FirebaseUserRepository(),
            )..add(AppStarted());
          },
        )
      ],
      child: MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Unauthenticated) {
              return LoginScreen(userRepository: FirebaseUserRepository());
            }
            if (state is Authenticated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<LibraryBooksBloc>(
                    create: (context) {
                      return LibraryBooksBloc(
                          libraryBooksRepository:
                              FirebaseLibraryBooksRepository(),
                          userId: state.user.uid)
                        ..add(LoadLibraryBooks());
                    },
                  ),
                  BlocProvider<UserMatchesBloc>(
                    create: (context) {
                      return UserMatchesBloc(
                          userMatchesRepository:
                          FirebaseUserMatchesRepository(),
                          userId: state.user.uid)
                        ..add(LoadUserMatches());
                    },
                  ),
                  BlocProvider<UserLocationBloc>(
                    create: (context) {
                      return UserLocationBloc(
                          userLocationRepository:
                          FirebaseUserLocationRepository(),
                          user: state.user,
                          geolocator: Geolocator())
                        ..add(LoadUserLocation());
                    },
                  ),
                  BlocProvider<BookBloc>(
                      create: (context) =>
                          BookBloc(bookRepository: _bookRepository)),
                  BlocProvider<BooksBloc>(
                      create: (context) =>
                          BooksBloc(bookRepository: _bookRepository)),
                  BlocProvider<UserMatchingBloc>(
                      create: (context) =>
                          UserMatchingBloc(userMatchingRepository: _userMatchingRepository)),
                  BlocProvider<FilteredLibraryBooksBloc>(
                    create: (context) => FilteredLibraryBooksBloc(
                      libraryBooksBloc:
                          BlocProvider.of<LibraryBooksBloc>(context),
                    ),
                  ),
                  BlocProvider<FilteredUserMatchesBloc>(
                    create: (context) => FilteredUserMatchesBloc(
                      userMatchesBloc:
                      BlocProvider.of<UserMatchesBloc>(context),
                      userId: state.user.uid
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
