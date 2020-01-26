import 'package:equatable/equatable.dart';
import 'package:user_location_repository/user_location_repository.dart';

abstract class UserLocationState extends Equatable {
  const UserLocationState();

  @override
  List<Object> get props => [];
}

class UserLocationLoading extends UserLocationState {}

class UserLocationLoaded extends UserLocationState {
  final UserLocation userLocation;

  const UserLocationLoaded(this.userLocation);

  @override
  List<Object> get props => [userLocation];

  @override
  String toString() => 'UserLocationLoaded { userLocation: $userLocation }';
}

class UserLocationError extends UserLocationState {}
