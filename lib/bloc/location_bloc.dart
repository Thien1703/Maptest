import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LoadCurrentLocation>((event, emit) async {
      try {
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          emit(LocationFailure("Dịch vụ vị trí đang bị tắt."));
          return;
        }

        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            emit(LocationFailure("Không có quyền truy cập vị trí."));
            return;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          emit(LocationFailure("Quyền vị trí bị từ chối vĩnh viễn."));
          return;
        }

        final position = await Geolocator.getCurrentPosition();
        emit(LocationLoaded(position));
      } catch (e) {
        emit(LocationFailure("Lỗi: $e"));
      }
    });
  }
}
