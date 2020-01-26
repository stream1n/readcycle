import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class LibraryBook {
  final bool wanted;
  final String id;
  final String name;
  final String pictureURL;
  final String isbn;
  final String user;

  LibraryBook(this.id, this.name, this.pictureURL, this.isbn, this.wanted, this.user);

  LibraryBook copyWith({bool wanted, String id, String name, String pictureURL, String isbn, String user}) {
    return LibraryBook(id, name, pictureURL, isbn, wanted, user);
  }

  @override
  int get hashCode =>
      wanted.hashCode ^ name.hashCode ^ pictureURL.hashCode ^ isbn.hashCode ^ id.hashCode ^ user.hashCode ;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LibraryBook &&
          runtimeType == other.runtimeType &&
          wanted == other.wanted &&
          name == other.name &&
          pictureURL == other.pictureURL &&
          isbn == other.isbn &&
          id == other.id &&
          user == other.user;

  @override
  String toString() {
    return 'LibraryBook{wanted: $wanted, name: $name, pictureURL: $pictureURL, isbn: $isbn, id: $id, user: $user}';
  }

  LibraryBookEntity toEntity() {
    return LibraryBookEntity(name, id, wanted, pictureURL, isbn, user);
  }

  static LibraryBook fromEntity(LibraryBookEntity entity) {
    return LibraryBook(
      entity.id,
      entity.name,
      entity.pictureURL,
      entity.isbn,
      entity.wanted,
      entity.user,
    );
  }
}
