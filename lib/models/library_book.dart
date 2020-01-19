import 'package:meta/meta.dart';
import 'package:readcycle/entities/entities.dart';
import 'package:readcycle/models/models.dart';

@immutable
class LibraryBook {

  final String id;
  final String user;
  final bool wanted;
  final String name;
  final List<String> authors;
  final String pictureURL;
  final String isbn;

  LibraryBook(this.user, this.name, this.authors, this.pictureURL, this.isbn, {this.wanted = false, String id}) : this.id = id;

  LibraryBook copyWith({String id, String user, bool wanted, Book book}) {
    return LibraryBook(
      user ?? this.user,
      name ?? this.name,
      authors ?? this.authors,
      pictureURL ?? this.pictureURL,
      isbn ?? this.isbn,
      wanted: wanted ?? this.wanted,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ user.hashCode ^ wanted.hashCode ^ name.hashCode ^ authors.hashCode ^ pictureURL.hashCode ^ isbn.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LibraryBook &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              authors == other.authors &&
              pictureURL == other.pictureURL &&
              isbn == other.isbn &&
              user == other.user &&
              wanted == other.wanted;

  @override
  String toString() {
    return 'LibraryBook { id: $id, user: $user, wanted: $wanted, name: $name, authors: $authors, pictureURL: $pictureURL, isbn: $isbn }';
  }

  LibraryBookEntity toEntity() {
    return LibraryBookEntity(id, user, wanted, name, authors, pictureURL, isbn);
  }

  static LibraryBook fromEntity(LibraryBookEntity entity) {
    return LibraryBook(
      entity.user,
      entity.name,
      entity.authors,
      entity.pictureURL,
      entity.isbn,
      wanted: entity.wanted ?? false,
      id: entity.id,
    );
  }
}