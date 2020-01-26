import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class UserProfileEntity extends Equatable {
  final Placemark location;
  final String id;

  const UserProfileEntity(this.location, this.id);

  Map<String, Object> toJson() {
    return {
      "location": location,
      "id": id
    };
  }

  @override
  List<Object> get props => [location, id];

  @override
  String toString() {
    return 'UserProfileEntity { location: $location, id: $id }';
  }

  static UserProfileEntity fromJson(Map<String, Object> json) {
    return UserProfileEntity(
      json["location"] as Placemark,
      json["id"] as String,
    );
  }

  static UserProfileEntity fromSnapshot(DocumentSnapshot snap) {
    return UserProfileEntity(
      snap.data['location'],
      snap.documentID,
    );
  }

  Map<String, Object> toDocument() {
    return {
      "location": location
    };
  }
}
