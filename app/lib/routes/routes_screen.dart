import 'package:app/routes/routes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes_details/trip_details_provider.dart';
import '../routes_details/trip_details_screen.dart';

class RouteListScreen extends StatefulWidget {
  @override
  _RouteListScreenState createState() => _RouteListScreenState();
}

class _RouteListScreenState extends State<RouteListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<RouteProvider>().fetchRoutes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Líneas de Transporte')),
      body: Consumer<RouteProvider>(
        builder: (context, routeProvider, child) {
          if (routeProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 15),
                  child: Text(
                    "Líneas",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15, right: 15),
                    child: Text(
                      "Estado del servicio",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end, // Alinear a la derecha
                    ),
                  ),
                ),
              ]),
              Expanded(
                child: ListView.builder(
                  itemCount: routeProvider.routes.length,
                  itemBuilder: (context, index) {
                    final route = routeProvider.routes[index];
                    return ListTile(
                      leading: Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.network(route.lineIcon,
                            color: Color(0xFF +
                                int.parse('0xff' + route.color.substring(1)))),
                      ),
                      title: Text(
                        route.routeShortName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(route.routeDesc),
                      trailing: route.affectedRoute
                          ? Icon(Icons.warning, color: Colors.red)
                          : Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TripDetailsScreen(
                                cityId: '1',
                                routeId: route.routeId,
                              )),
                        );
                      },
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
