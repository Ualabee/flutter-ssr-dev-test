import 'package:app/routes/routes_provider.dart';
import 'package:app/routes/routes_screen.dart';
import 'package:app/routes_details/trip_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouteProvider()),
        ChangeNotifierProvider(create: (_) => TripDetailsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transporte',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RouteListScreen(),
    );
  }
}
