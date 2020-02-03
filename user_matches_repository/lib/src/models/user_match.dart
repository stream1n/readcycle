import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class UserMatch {
  final String userThatWillTravel;
  final String userThatWillTravelName;
  final String userThatWillTravelPhoto;
  final String userThatWillStay;
  final String userThatWillStayName;
  final String userThatWillStayPhoto;
  final double distance;
  final String book1Ref;
  final String book2Ref;
  final String isbn;
  final String name;
  final String pictureURL;
  final String id;

  UserMatch(this.id, this.userThatWillTravel, this.userThatWillTravelName, this.userThatWillTravelPhoto, this.userThatWillStay, this.userThatWillStayName, this.userThatWillStayPhoto, this.distance, this.book1Ref, this.book2Ref, this.isbn, this.name, this.pictureURL);

  UserMatch copyWith({String userThatWillTravel, String id, String userThatWillTravelName, String userThatWillTravelPhoto, String userThatWillStay, String userThatWillStayName, String userThatWillStayPhoto, double distance, String book1Ref, String book2Ref, String isbn, String name, String pictureURL}) {
    return UserMatch(id, userThatWillTravel, userThatWillTravelName, userThatWillTravelPhoto, userThatWillStay, userThatWillStayName, userThatWillStayPhoto, distance, book1Ref, book2Ref, isbn, name, pictureURL);
  }

  @override
  int get hashCode =>
      userThatWillTravel.hashCode ^ userThatWillTravelName.hashCode ^ userThatWillTravelPhoto.hashCode ^ userThatWillStay.hashCode ^ id.hashCode ^ userThatWillStayName.hashCode ^ userThatWillStayPhoto.hashCode ^ distance.hashCode ^ book1Ref.hashCode ^ book2Ref.hashCode ^ isbn.hashCode ^ name.hashCode ^ pictureURL.hashCode ;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserMatch &&
          runtimeType == other.runtimeType &&
          userThatWillTravel == other.userThatWillTravel &&
          userThatWillTravelName == other.userThatWillTravelName &&
          userThatWillTravelPhoto == other.userThatWillTravelPhoto &&
          userThatWillStay == other.userThatWillStay &&
          id == other.id &&
          userThatWillStayName == other.userThatWillStayName &&
          userThatWillStayPhoto == other.userThatWillStayPhoto &&
          distance == other.distance &&
          book1Ref == other.book1Ref &&
          book2Ref == other.book2Ref &&
          isbn == other.isbn &&
          name == other.name &&
          pictureURL == other.pictureURL;

  @override
  String toString() {
    return 'UserMatch{userThatWillTravel: $userThatWillTravel, userThatWillTravelName: $userThatWillTravelName, userThatWillTravelPhoto: $userThatWillTravelPhoto, userThatWillStay: $userThatWillStay, id: $id, userThatWillStayName: $userThatWillStayName, userThatWillStayPhoto: $userThatWillStayPhoto, distance: $distance, book1Ref: $book1Ref, book2Ref: $book2Ref, isbn: $isbn, name: $name, pictureURL: $pictureURL}';
  }

  UserMatchEntity toEntity() {
    return UserMatchEntity(userThatWillTravel, id, userThatWillTravelName, userThatWillTravelPhoto, userThatWillStay, userThatWillStayName, userThatWillStayPhoto, distance, book1Ref, book2Ref, isbn, name, pictureURL);
  }

  static UserMatch fromEntity(UserMatchEntity entity) {
    return UserMatch(
      entity.id,
      entity.userThatWillTravel,
      entity.userThatWillTravelName,
      entity.userThatWillTravelPhoto,
      entity.userThatWillStay,
      entity.userThatWillStayName,
      entity.userThatWillStayPhoto,
      entity.distance,
      entity.book1Ref,
      entity.book2Ref,
      entity.isbn,
      entity.name,
      entity.pictureURL

    );
  }
}
