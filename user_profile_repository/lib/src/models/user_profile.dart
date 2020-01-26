import 'package:meta/meta.dart';
import '../entities/entities.dart';
import 'package:geolocator/geolocator.dart';

@immutable
class UserProfile {
  final Placemark location;
  final String id;

  UserProfile(this.id, this.location);

  UserProfile copyWith({Placemark location, String id}) {
    return UserProfile(id, location);
  }

  @override
  int get hashCode =>
      location.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfile &&
          runtimeType == other.runtimeType &&
          location == other.location &&
          id == other.id;

  @override
  String toString() {
    return 'UserProfile{location: $location, id: $id}';
  }

  UserProfileEntity toEntity() {
    return UserProfileEntity(location, id);
  }

  static UserProfile fromEntity(UserProfileEntity entity) {
    return UserProfile(
      entity.id,
      entity.location
    );
  }
}
