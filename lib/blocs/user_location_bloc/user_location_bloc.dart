import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:user_location_repository/user_location_repository.dart';
import 'package:geolocator/geolocator.dart';

class UserLocationBloc extends Bloc<UserLocationEvent, UserLocationState> {
  final String _userId;
  final UserLocationRepository _userLocationRepository;
  final Geolocator _geolocator;

  UserLocationBloc({@required UserLocationRepository userLocationRepository, @required String userId, @required Geolocator geolocator})
      : assert(userLocationRepository != null && userId != null && geolocator != null),
        _userLocationRepository = userLocationRepository,
        _userId = userId,
        _geolocator = geolocator;

  @override
  UserLocationState get initialState => UserLocationLoading();

  @override
  Stream<UserLocationState> mapEventToState(UserLocationEvent event) async* {
    if (event is LoadUserLocation) {
      yield* _mapLoadUserLocationToState();
    } else if (event is AddUserLocation) {
      yield* _mapAddUserLocationToState(event);
    } else if (event is UpdateUserLocation) {
      yield* _mapUpdateUserLocationToState();
    } else if (event is DeleteUserLocation) {
      yield* _mapDeleteUserLocationToState(event);
    }
  }

  Stream<UserLocationState> _mapLoadUserLocationToState() async* {

    yield UserLocationLoading();
    try {
      final bool exists = await _userLocationRepository.doesUserLocationExist(_userId);

      if (exists) {
        final UserLocation userLocation = await _userLocationRepository
            .getUserLocation(_userId);
        yield UserLocationLoaded(userLocation);
      } else {
        final Position position = await _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        final List<Placemark> placemarks = await _geolocator.placemarkFromPosition(position);
        Placemark placemark = placemarks[0];
        UserLocation userLocation = new UserLocation(_userId,  placemark.name, placemark.isoCountryCode, placemark.country, placemark.postalCode, placemark.locality, placemark.position.longitude, placemark.position.latitude);
        _userLocationRepository.addNewUserLocation(userLocation);
        yield UserLocationLoaded(userLocation);
      }
    } catch (_) {
      yield UserLocationError();
    }

  }

  Stream<UserLocationState> _mapAddUserLocationToState(AddUserLocation event) async* {
    _userLocationRepository.addNewUserLocation(event.userLocation);
  }

  Stream<UserLocationState> _mapUpdateUserLocationToState() async* {

    yield UserLocationLoading();
    try {
        final UserLocation userLocation = await _userLocationRepository.getUserLocation(_userId);
        final Position position = await _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        final List<Placemark> placemarks = await _geolocator.placemarkFromPosition(position);
        Placemark placemark = placemarks[0];
        UserLocation userLocationUpdate = userLocation.copyWith(name: placemark.name, isoCountryCode: placemark.isoCountryCode, country: placemark.country, postalCode: placemark.postalCode, locality: placemark.locality, longitude: placemark.position.longitude, latitude: placemark.position.latitude, id: _userId);
        _userLocationRepository.updateUserLocation(userLocationUpdate);
        yield UserLocationLoaded(userLocation);
    } catch (_) {
      yield UserLocationError();
    }

  }

  Stream<UserLocationState> _mapDeleteUserLocationToState(DeleteUserLocation event) async* {
    _userLocationRepository.deleteUserLocation(event.userLocation);
  }

}
