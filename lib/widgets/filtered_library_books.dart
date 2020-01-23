import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:readcycle/widgets/widgets.dart';

class FilteredLibraryBooks extends StatelessWidget {
  FilteredLibraryBooks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredLibraryBooksBloc, FilteredLibraryBooksState>(
      builder: (context, state) {
        if (state is FilteredLibraryBooksLoading) {
          return LoadingIndicator();
        } else if (state is FilteredLibraryBooksLoaded) {
          final libraryBooks = state.filteredLibraryBooks;
          return ListView.builder(
            itemCount: libraryBooks.length,
            itemBuilder: (context, index) {
              final libraryBook = libraryBooks[index];
              return LibraryBookItem(
                libraryBook: libraryBook,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
