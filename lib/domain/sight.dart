class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final String type;
  final bool visited;
  final String? date;

  Sight({
    required this.name,
    required this.lat,
    required this.lon,
    required this.url,
    required this.details,
    required this.type,
    required this.visited,
    this.date,
  });
}
