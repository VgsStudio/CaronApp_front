class Local {
  late String title;
  late double lat;
  late double long;
  late double latNortheast;
  late double longNortheast;
  late double latSouthwest;
  late double longSouthwest;
  late String markerId;
  late String snippet;
  late String polyline;
  late double hue;
  late var icon;

  Local(
    this.title,
    this.lat,
    this.long,
    this.latNortheast,
    this.longNortheast,
    this.latSouthwest,
    this.longSouthwest,
    this.markerId,
    this.snippet,
    this.polyline,
    this.hue,
    this.icon,
  );
}
