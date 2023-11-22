class LocationDto {
  final double userLongitude;
  final double userLatitude;
  final double targetLongitude;
  final double targetLatitude;
  final String address;

  LocationDto({
    required this.userLongitude,
    required this.userLatitude,
    required this.targetLongitude,
    required this.targetLatitude,
    required this.address,
  });
}
