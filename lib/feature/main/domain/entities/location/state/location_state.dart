
import 'package:simple_sample/feature/main/domain/entities/location/response/location_response.dart';

class LocationState {
  LocationState();
}

class LocationInit extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final List<LocationResponse> locations;

  LocationSuccess({
    required this.locations,
  });
}

class LocationFailed extends LocationState {
  final String message;

  LocationFailed({
    required this.message,
  });
}