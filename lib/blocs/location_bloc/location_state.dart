import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationEmpty extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final List<Placemark> placemarks;

  const LocationLoaded({@required this.placemarks}) : assert(placemarks != null);

  @override
  List<Object> get props => [placemarks];
}

class LocationError extends LocationState {}