part of 'location_bloc.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  final Position position;
  LocationLoaded(this.position);
}

class LocationFailure extends LocationState {
  final String error;
  LocationFailure(this.error);
}
