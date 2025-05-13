import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/bloc/location_bloc.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationBloc()..add(LoadCurrentLocation()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Google Map")),
        body: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LocationLoaded) {
              final position = state.position;
              return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 15,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("currentLocation"),
                    position: LatLng(position.latitude, position.longitude),
                    infoWindow: const InfoWindow(title: "Vị trí của bạn"),
                  )
                },
              );
            } else if (state is LocationFailure) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: Text("Không xác định trạng thái."));
            }
          },
        ),
      ),
    );
  }
}
