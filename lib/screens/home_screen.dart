import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../book_bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state is BookEmpty) {
              return Center(child: Text('Scan a Book ISBN'));
            }
            if (state is BookLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is BookLoaded) {
              final book = state.book;
              return Image.network(
                book.pictureURL,
              );
            }
            if (state is BookError) {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final isbn = await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true, ScanMode.BARCODE);
          if (isbn != null) {
            BlocProvider.of<BookBloc>(context)
                .add(FetchBookByISBN(isbn: isbn));
          }
        },
        tooltip: 'Scan ISBN',
        child: Icon(Icons.settings_overscan),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
