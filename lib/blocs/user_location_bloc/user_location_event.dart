import 'package:equatable/equatable.dart';
import 'package:user_location_repository/user_location_repository.dart';

abstract class UserLocationEvent extends Equatable {
  const UserLocationEvent();

  @override
  List<Object> get props => [];
}

class LoadUserLocation extends UserLocationEvent {}

class UpdateUserLocation extends UserLocationEvent {}

class AddUserLocation extends UserLocationEvent {
  final UserLocation userLocation;

  const AddUserLocation(this.userLocation);

  @override
  List<Object> get props => [userLocation];

  @override
  String toString() => 'AddUserLocation { userLocation: $userLocation }';
}

class DeleteUserLocation extends UserLocationEvent {
  final UserLocation userLocation;

  const DeleteUserLocation(this.userLocation);

  @override
  List<Object> get props => [userLocation];

  @override
  String toString() => 'DeleteUserLocation { userLocation: $userLocation }';
}
