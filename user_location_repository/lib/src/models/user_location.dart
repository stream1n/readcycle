import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class UserLocation {

  final String id;
  final String name;
  final String isoCountryCode;
  final String country;
  final String postalCode;
  final String locality;
  final double longitude;
  final double latitude;
  final double maxDistanceUserWantsToTravel;
  final double maxDistanceUserWantsOthersToTravelFrom;

  UserLocation(this.id, this.name, this.isoCountryCode, this.country, this.postalCode, this.locality, this.longitude, this.latitude, this.maxDistanceUserWantsToTravel, this.maxDistanceUserWantsOthersToTravelFrom);

  UserLocation copyWith({String name, String isoCountryCode, String country, String postalCode, String locality, double longitude, double latitude, double maxDistanceUserWantsToTravel, double maxDistanceUserWantsOthersToTravelFrom, String id}) {
    return UserLocation(id, name, isoCountryCode, country, postalCode, locality, longitude, latitude, maxDistanceUserWantsToTravel, maxDistanceUserWantsOthersToTravelFrom);
  }

  @override
  int get hashCode =>
      name.hashCode ^ isoCountryCode.hashCode ^ country.hashCode ^ postalCode.hashCode ^ locality.hashCode ^ longitude.hashCode ^ latitude.hashCode ^ maxDistanceUserWantsToTravel.hashCode ^ maxDistanceUserWantsOthersToTravelFrom.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocation &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          isoCountryCode == other.isoCountryCode &&
          country == other.country &&
          postalCode == other.postalCode &&
          locality == other.locality &&
          longitude == other.longitude &&
          latitude == other.latitude &&
          maxDistanceUserWantsToTravel == other.maxDistanceUserWantsToTravel &&
          maxDistanceUserWantsOthersToTravelFrom == other.maxDistanceUserWantsOthersToTravelFrom &&
          id == other.id;

  @override
  String toString() {
    return 'UserLocation{name: $name, isoCountryCode: $isoCountryCode, country: $country, postalCode: $postalCode, locality: $locality, longitude: $longitude, latitude: $latitude, maxDistanceUserWantsToTravel: $maxDistanceUserWantsToTravel, maxDistanceUserWantsOthersToTravelFrom: $maxDistanceUserWantsOthersToTravelFrom, id: $id}';
  }

  UserLocationEntity toEntity() {
    return UserLocationEntity(name, isoCountryCode, country, postalCode, locality, longitude, latitude, maxDistanceUserWantsToTravel, maxDistanceUserWantsOthersToTravelFrom, id);
  }

  static UserLocation fromEntity(UserLocationEntity entity) {
    return UserLocation(
      entity.id,
      entity.name,
      entity.isoCountryCode,
      entity.country,
      entity.postalCode,
      entity.locality,
      entity.longitude,
      entity.latitude,
      entity.maxDistanceUserWantsToTravel,
      entity.maxDistanceUserWantsOthersToTravelFrom,
    );
  }
}
