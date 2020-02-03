import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserMatchEntity extends Equatable {
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

  const UserMatchEntity(this.userThatWillTravel, this.id, this.userThatWillTravelName, this.userThatWillTravelPhoto, this.userThatWillStay, this.userThatWillStayName, this.userThatWillStayPhoto, this.distance, this.book1Ref, this.book2Ref, this.isbn, this.name, this.pictureURL);

  Map<String, Object> toJson() {
    return {
      "userThatWillTravel": userThatWillTravel,
      "userThatWillTravelName": userThatWillTravelName,
      "id": id,
      "userThatWillTravelPhoto": userThatWillTravelPhoto,
      "userThatWillStay": userThatWillStay,
      "userThatWillStayName": userThatWillStayName,
      "userThatWillStayName": userThatWillStayPhoto,
      "userThatWillStayName": distance,
      "userThatWillStayName": book1Ref,
      "userThatWillStayName": book2Ref,
      "userThatWillStayName": isbn,
      "userThatWillStayName": name,
      "userThatWillStayName": pictureURL
    };
  }

  @override
  List<Object> get props => [userThatWillTravel, id, userThatWillTravelName, userThatWillTravelPhoto, userThatWillStay, userThatWillStayName, userThatWillStayPhoto, distance, book1Ref, book2Ref, isbn, name, pictureURL];

  @override
  String toString() {
    return 'UserMatchEntity { userThatWillTravel: $userThatWillTravel, userThatWillTravelName: $userThatWillTravelName, id: $id, userThatWillTravelPhoto: $userThatWillTravelPhoto, userThatWillStay: $userThatWillStay, userThatWillStayName: $userThatWillStayName, userThatWillStayPhoto: $userThatWillStayPhoto, distance: $distance, book1Ref: $book1Ref, book2Ref: $book2Ref, isbn: $isbn, name: $name, pictureURL: $pictureURL }';
  }

  static UserMatchEntity fromJson(Map<String, Object> json) {
    return UserMatchEntity(
      json["userThatWillTravel"] as String,
      json["id"] as String,
      json["userThatWillTravelName"] as String,
      json["userThatWillTravelPhoto"] as String,
      json["userThatWillStay"] as String,
      json["userThatWillStayName"] as String,
      json["userThatWillStayPhoto"] as String,
      json["distance"] as double,
      json["book1Ref"] as String,
      json["book2Ref"] as String,
      json["isbn"] as String,
      json["name"] as String,
      json["pictureURL"] as String
    );
  }

  static UserMatchEntity fromSnapshot(DocumentSnapshot snap) {
    return UserMatchEntity(
      snap.data['userThatWillTravel'],
      snap.documentID,
      snap.data['userThatWillTravelName'],
      snap.data['userThatWillTravelPhoto'],
      snap.data['userThatWillStay'],
      snap.data['userThatWillStayName'],
      snap.data['userThatWillStayPhoto'],
      snap.data['distance'],
      snap.data['book1Ref'],
      snap.data['book2Ref'],
      snap.data['isbn'],
      snap.data['name'],
      snap.data['pictureURL']
    );
  }

  Map<String, Object> toDocument() {
    return {
      "userThatWillTravel": userThatWillTravel,
      "userThatWillTravelName": userThatWillTravelName,
      "userThatWillTravelPhoto": userThatWillTravelPhoto,
      "userThatWillStay": userThatWillStay,
      "userThatWillStayName": userThatWillStayName,
      "userThatWillStayName": userThatWillStayPhoto,
      "userThatWillStayName": distance,
      "userThatWillStayName": book1Ref,
      "userThatWillStayName": book2Ref,
      "userThatWillStayName": isbn,
      "userThatWillStayName": name,
      "userThatWillStayName": userThatWillStayName,

    };
  }
}
