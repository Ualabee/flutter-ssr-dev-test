import 'package:app/routes/route_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RouteProvider extends ChangeNotifier {
  List<RouteModel> _routes = [];
  bool _isLoading = false;

  List<RouteModel> get routes => _routes;

  bool get isLoading => _isLoading;

  Future<void> fetchRoutes() async {
    _isLoading = true;
    notifyListeners();

    final url = 'https://ualabee.dev/api/v2/routes/getAll';
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({"city_id": 1}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJ1YWxhYmVlIiwiaXNzIjoiVWFsYWJlZSBBUEkgQWxwaGEgVGVzdGluZyIsInN1YiI6IjIiLCJuYW1lIjoiVWFsYWJlZSIsImlhdCI6MTUxNjIzOTAyMn0.dxRc2ufhuHrRq25AuO-s1LwQygUt4F6KD2JHhxIdEHE',
      },
    );

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['result'];
      _routes = List<RouteModel>.from(
        result.map((data) => RouteModel.fromJson(data)),
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
