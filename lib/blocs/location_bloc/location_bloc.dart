import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:readcycle/blocs/blocs.dart';
import 'package:geolocator/geolocator.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final Geolocator geolocator;

  LocationBloc({@required this.geolocator}) : assert(geolocator != null);

  @override
  LocationState get initialState => LocationEmpty();

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    if (event is FetchLocation) {
      yield* _mapFetchLocationToState(event);
    }
  }

  Stream<LocationState> _mapFetchLocationToState(FetchLocation event) async* {
    yield LocationLoading();
    try {
      final Position position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      final List<Placemark> placemarks = await geolocator.placemarkFromPosition(position);
      yield LocationLoaded(placemarks: placemarks);
    } catch (_) {
      yield LocationError();
    }
  }

}
