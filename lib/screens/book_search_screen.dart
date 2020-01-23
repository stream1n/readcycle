import 'package:firebase_auth/firebase_auth.dart';
import 'package:readcycle/blocs/books_bloc/bloc.dart';
import 'package:readcycle/blocs/library_books/library_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_books_repository/library_books_repository.dart';
import 'package:readcycle/widgets/widgets.dart';

class BookSearchScreen extends StatefulWidget {

  final FirebaseUser user;

  BookSearchScreen({Key key, @required this.user}) : super(key: key);

  @override
  BookSearchScreenState createState() {
    return BookSearchScreenState();
  }
}

class BookSearchScreenState extends State<BookSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find a Book'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final author = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthorSelection(),
                ),
              );
              if (author != null) {
                BlocProvider.of<BooksBloc>(context)
                    .add(FetchBooksByAuthor(author: author));
              }
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<BooksBloc, BooksState>(
          builder: (context, state) {
            if (state is BooksEmpty) {
              return Center(child: Text('Search by an author'));
            }
            if (state is BooksLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is BooksLoaded) {
              final books = state.books;

              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  final item = book.name;
                  return Dismissible(
                    background: SlideRightBackground(),
                    secondaryBackground: SlideLeftBackground(),
                    key: Key(item),
                    onDismissed: (direction) {
                      bool wanted = false;
                      String message = 'added to your library';

                      if( direction == DismissDirection.startToEnd) {
                        wanted = true;
                        message = 'added to your wanted list';
                      }

                      BlocProvider.of<LibraryBooksBloc>(context).add(
                        AddLibraryBook(LibraryBook(widget.user.uid, book.name, book.pictureURL, book.isbn, wanted)),
                      );

                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("$item $message")));

                      setState(() {
                        books.removeAt(index);
                      });

                    },
                    child: ListTile(
                        leading: Image.network(book.pictureURL),
                        title: Text(book.name),
                        subtitle: Text(book.authors[0])),
                  );
                },
              );
            }
            if (state is BooksError) {
              return Text(
                'Could not find your books!',
                style: TextStyle(color: Colors.red),
              );
            } else {
              return Text(
                'Unhandled Event!',
                style: TextStyle(color: Colors.red),
              );
            }
          },
        ),
      ),
    );
  }

}
