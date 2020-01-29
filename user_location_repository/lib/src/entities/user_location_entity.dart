import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationEntity extends Equatable {
  final String name;
  final String isoCountryCode;
  final String country;
  final String postalCode;
  final String locality;
  final double longitude;
  final double latitude;
  final double maxDistanceUserWantsToTravel;
  final double maxDistanceUserWantsOthersToTravelFrom;
  final String id;

  const UserLocationEntity(this.name, this.isoCountryCode, this.country, this.postalCode, this.locality, this.longitude, this.latitude, this.maxDistanceUserWantsToTravel, this.maxDistanceUserWantsOthersToTravelFrom, this.id);

  Map<String, Object> toJson() {
    return {
      "name": name,
      "isoCountryCode": isoCountryCode,
      "country": country,
      "postalCode": postalCode,
      "locality": locality,
      "longitude": longitude,
      "latitude": latitude,
      "maxDistanceUserWantsToTravel": maxDistanceUserWantsToTravel,
      "maxDistanceUserWantsOthersToTravelFrom": maxDistanceUserWantsOthersToTravelFrom,
      "id": id
    };
  }

  @override
  List<Object> get props => [name, isoCountryCode, country, postalCode, locality, longitude, latitude, maxDistanceUserWantsToTravel, maxDistanceUserWantsOthersToTravelFrom, id];

  @override
  String toString() {
    return 'UserLocationEntity { name: $name, isoCountryCode: $isoCountryCode, country: $country, postalCode: $postalCode, locality: $locality, longitude: $longitude, latitude: $latitude, maxDistanceUserWantsToTravel: $maxDistanceUserWantsToTravel, maxDistanceUserWantsOthersToTravelFrom: $maxDistanceUserWantsOthersToTravelFrom, id: $id }';
  }

  static UserLocationEntity fromJson(Map<String, Object> json) {
    return UserLocationEntity(
      json["name"] as String,
      json["isoCountryCode"] as String,
      json["country"] as String,
      json["postalCode"] as String,
      json["locality"] as String,
      json["longitude"] as double,
      json["latitude"] as double,
      json["maxDistanceUserWantsToTravel"] as double,
      json["maxDistanceUserWantsOthersToTravelFrom"] as double,
      json["id"] as String,
    );
  }

  static UserLocationEntity fromSnapshot(DocumentSnapshot snap) {
    return UserLocationEntity(
      snap.data['name'],
      snap.data['isoCountryCode'],
      snap.data['country'],
      snap.data['postalCode'],
      snap.data['locality'],
      snap.data['longitude'],
      snap.data['latitude'],
      snap.data['maxDistanceUserWantsToTravel'],
      snap.data['maxDistanceUserWantsOthersToTravelFrom'],
      snap.documentID,
    );
  }

  Map<String, Object> toDocument() {
    return {
      "name": name,
      "isoCountryCode": isoCountryCode,
      "country": country,
      "postalCode": postalCode,
      "locality": locality,
      "longitude": longitude,
      "latitude": latitude,
      "maxDistanceUserWantsToTravel": maxDistanceUserWantsToTravel,
      "maxDistanceUserWantsOthersToTravelFrom": maxDistanceUserWantsOthersToTravelFrom,
      "id": id
    };
  }
}
