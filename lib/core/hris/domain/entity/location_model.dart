class LocationModel {
  final double userLongitude;
  final double userLatitude;
  final double targetLongitude;
  final double targetLatitude;
  final String address;

  LocationModel({
    required this.userLongitude,
    required this.userLatitude,
    required this.targetLongitude,
    required this.targetLatitude,
    required this.address,
  });
}
