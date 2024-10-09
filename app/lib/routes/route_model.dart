class RouteModel {
  final String routeId;
  final String routeShortName;
  final String routeDesc;
  final String routeColor;
  final String agencyName;
  final String lineIcon;
  final String color;
  final bool affectedRoute;

  RouteModel({
    required this.routeId,
    required this.routeShortName,
    required this.routeDesc,
    required this.routeColor,
    required this.agencyName,
    required this.lineIcon,
    required this.color,
    required this.affectedRoute,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      routeId: json['route_id'],
      routeShortName: json['route_short_name'],
      routeDesc: json['route_desc'],
      routeColor: json['route_color'],
      agencyName: json['agency']['agency_name'],
      lineIcon: json['transport_type']['flat_icon'],
      color: json['transport_type']['color'],
      affectedRoute: json['affected_route'],
    );
  }
}
