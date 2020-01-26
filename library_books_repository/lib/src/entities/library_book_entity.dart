import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class LibraryBookEntity extends Equatable {
  final bool wanted;
  final String id;
  final String name;
  final String pictureURL;
  final String isbn;
  final String user;

  const LibraryBookEntity(this.name, this.id, this.wanted, this.pictureURL, this.isbn, this.user);

  Map<String, Object> toJson() {
    return {
      "wanted": wanted,
      "name": name,
      "id": id,
      "pictureURL": pictureURL,
      "isbn": isbn,
      "user": user,
    };
  }

  @override
  List<Object> get props => [wanted, id, name, pictureURL, isbn, user];

  @override
  String toString() {
    return 'LibraryBookEntity { wanted: $wanted, name: $name, id: $id, pictureURL: $pictureURL, isbn: $isbn, user: $user }';
  }

  static LibraryBookEntity fromJson(Map<String, Object> json) {
    return LibraryBookEntity(
      json["name"] as String,
      json["id"] as String,
      json["wanted"] as bool,
      json["pictureURL"] as String,
      json["isbn"] as String,
      json["user"] as String,
    );
  }

  static LibraryBookEntity fromSnapshot(DocumentSnapshot snap) {
    return LibraryBookEntity(
      snap.data['name'],
      snap.documentID,
      snap.data['wanted'],
      snap.data['pictureURL'],
      snap.data['isbn'],
      snap.data['user'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "wanted": wanted,
      "name": name,
      "pictureURL": pictureURL,
      "isbn": isbn,
      "user": user,
    };
  }
}
