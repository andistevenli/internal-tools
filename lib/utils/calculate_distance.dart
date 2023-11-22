//mengecek jarak dari lokasi yang ditentukan
import 'dart:math';

double calculateDistance(double userLatitude, double userLongitude, double targetLatitude, double targetLongitude) {
  const double earthRadius = 6371.0; // Earth radius in kilometers
  double dLat = (targetLatitude - userLatitude) * (pi / 180.0);
  double dLon = (targetLongitude - userLongitude) * (pi / 180.0);

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(userLatitude * (pi / 180.0)) *
          cos(targetLatitude * (pi / 180.0)) *
          sin(dLon / 2) *
          sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distance = earthRadius * c;
  return distance;
}