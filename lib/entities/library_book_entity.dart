import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class LibraryBookEntity extends Equatable {
  final String id;
  final String user;
  final bool wanted;
  final String name;
  final List<String> authors;
  final String pictureURL;
  final String isbn;

  const LibraryBookEntity(this.id, this.user, this.wanted, this.name,
      this.authors, this.pictureURL, this.isbn);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "user": user,
      "wanted": wanted,
      "book": name,
      "authors": authors,
      "pictureURL": pictureURL,
      "isbn": isbn
    };
  }

  @override
  List<Object> get props => [id, user, wanted, name, authors, pictureURL, isbn];

  @override
  String toString() {
    return 'LibraryEntity { id: $id, user: $user, wanted: $wanted, name: $name, authors: $authors, pictureURL: $pictureURL, isbn: $isbn }';
  }

  static LibraryBookEntity fromJson(Map<String, Object> json) {
    return LibraryBookEntity(
        json["id"] as String,
        json["user"] as String,
        json["wanted"] as bool,
        json["name"] as String,
        json["authors"] as List<String>,
        json["pictureURL"] as String,
        json["isbn"] as String);
  }

  static LibraryBookEntity fromSnapshot(DocumentSnapshot snap) {
    return LibraryBookEntity(
      snap.documentID,
      snap.data['user'],
      snap.data['wanted'],
      snap.data['name'],
      snap.data['authors'],
      snap.data['pictureURL'],
      snap.data['isbn'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "user": user,
      "wanted": wanted,
      "name": name,
      "authors": authors,
      "pictureURL": pictureURL,
      "isbn": isbn
    };
  }
}
