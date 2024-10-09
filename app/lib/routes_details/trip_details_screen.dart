import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'trip_details_provider.dart';

class TripDetailsScreen extends StatefulWidget {
  final String cityId;
  final String routeId;

  TripDetailsScreen({required this.cityId, required this.routeId});

  @override
  _TripDetailsScreenState createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    // Fetch trip details when the screen initializes
    Provider.of<TripDetailsProvider>(context, listen: false)
        .fetchTripDetails(widget.cityId, widget.routeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Viaje'),
      ),
      body: Consumer<TripDetailsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage));
          }

          if (provider.tripDetails == null) {
            return Center(child: Text('No se encontraron detalles'));
          }

          return Column(
            children: [
              // Google Map
              Expanded(
                flex: 1,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-31.4201, -64.1888), // Coordenadas de Córdoba, Argentina
                    zoom: 14,
                  ),
                  markers: provider.markers,
                  polylines: {
                    Polyline(
                      polylineId: PolylineId('route'),
                      points: provider.polylineCoordinates,
                      color: Colors.blue,
                      width: 5,
                    ),
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                ),
              ),
              // Lista de paradas
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: provider.tripDetails!.stops.length,
                  itemBuilder: (context, index) {
                    final stop = provider.tripDetails!.stops[index];
                    return ListTile(
                      title: Text(stop.stopName),
                      subtitle: Text(
                          'Llegada: ${stop.arrivalTime} | Salida: ${stop.departureTime}'),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
