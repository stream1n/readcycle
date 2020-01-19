import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/filtered_library_book_bloc/blocs.dart';
import '../authentication_bloc/bloc.dart';

class ProfileScreen extends StatelessWidget {

  final FirebaseUser user;

  ProfileScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredLibraryBooksBloc, FilteredLibraryBooksState>(
      builder: (context, state) {
        if (state is FilteredLibraryBooksLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilteredLibraryBooksLoaded) {
          final libraryBooks = state.filteredLibraryBooks;
          return ListView.builder(
            itemCount: libraryBooks.length,
            itemBuilder: (context, index) {
              final libraryBook = libraryBooks[index];
              return Text(libraryBook.name);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  /*@override
  Widget build(BuildContext context) {

    final String name = user.displayName;
    final String email = user.email;
    final String photoURL = user.photoUrl;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
              photoURL,
            ),
            radius: 50,
            backgroundColor: Colors.transparent,
          ),
          Center(child: Text('Welcome $name!')),
          Center(child: Text('$email')),
        ],
      ),
    );
  }*/
}