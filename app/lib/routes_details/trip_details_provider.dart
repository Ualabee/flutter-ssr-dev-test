import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TripDetailsModel {
  final String tripId;
  final String tripHeadsign;
  final List<Stop> stops;
  final String shape;

  TripDetailsModel({
    required this.tripId,
    required this.tripHeadsign,
    required this.stops,
    required this.shape,
  });

  factory TripDetailsModel.fromJson(Map<String, dynamic> json) {
    var stopsList = json['trips'][0]['stops'] as List;
    List<Stop> stops = stopsList.map((stop) => Stop.fromJson(stop)).toList();

    return TripDetailsModel(
      tripId: json['trips'][0]['trip_id'],
      tripHeadsign: json['trips'][0]['trip_headsign'],
      stops: stops,
      shape: json['trips'][0]['shape'],
    );
  }
}

// Modelo para Stop
class Stop {
  final String stopName;
  final String arrivalTime;
  final String departureTime;
  final double stopLat;
  final double stopLon;

  Stop({
    required this.stopName,
    required this.arrivalTime,
    required this.departureTime,
    this.stopLat = 0.0,
    this.stopLon = 0.0,
  });

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      stopName: json['stop_name'],
      arrivalTime: json['stop_times']['arrival_time'],
      departureTime: json['stop_times']['departure_time'],
      stopLat: json['stop_lat'],
      stopLon: json['stop_lon'],
    );
  }
}

// Provider para manejar la lógica y el estado de los detalles del viaje
class TripDetailsProvider extends ChangeNotifier {
  TripDetailsModel? tripDetails;
  bool isLoading = true;
  String errorMessage = '';
  Set<Marker> markers = {};
  List<LatLng> polylineCoordinates = [];

  Future<void> fetchTripDetails(String cityId, String routeId) async {
    final url = Uri.parse('https://ualabee.dev/api/v2/routes/getTrips');
    final body = jsonEncode({
      "city_id": cityId,
      "route_id": routeId,
    });

    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJ1YWxhYmVlIiwiaXNzIjoiVWFsYWJlZSBBUEkgQWxwaGEgVGVzdGluZyIsInN1YiI6IjIiLCJuYW1lIjoiVWFsYWJlZSIsImlhdCI6MTUxNjIzOTAyMn0.dxRc2ufhuHrRq25AuO-s1LwQygUt4F6KD2JHhxIdEHE',
    };

    isLoading = true;
    errorMessage = '';

    try {
      final response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['result'];

        tripDetails = TripDetailsModel.fromJson(data);
        _populateMarkersAndPolyline();
      } else {
        errorMessage = 'Error al obtener los detalles del viaje';
      }
    } catch (e) {
      errorMessage = 'Ocurrió un error: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _populateMarkersAndPolyline() {
    if (tripDetails != null) {
      // Crear los markers para cada parada
      markers = tripDetails!.stops.map((stop) {
        return Marker(
          markerId: MarkerId(stop.stopName),
          position: LatLng(
            stop.stopLat,
            stop.stopLon,
          ),
          infoWindow: InfoWindow(
            title: stop.stopName,
            snippet: 'Llegada: ${stop.arrivalTime} - Salida: ${stop.departureTime}',
          ),
        );
      }).toSet();

      // Crear la polyline a partir del shape
      polylineCoordinates = _decodePolyline(tripDetails!.shape);
    }
  }

  List<LatLng> _decodePolyline(String encodedPolyline) {
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> result = polylinePoints.decodePolyline(encodedPolyline);

    List<LatLng> decodedCoordinates = result.map(
          (point) => LatLng(point.latitude, point.longitude),
    ).toList();

    return decodedCoordinates;
  }
}

