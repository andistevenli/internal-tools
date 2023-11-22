import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:internal_tools/core/hris/data/dto/location_dto.dart';
import 'package:internal_tools/utils/cofi_location.dart';

class LocationDataSource {
  Future<LocationDto> getCurrentLocation() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
      // get longitude and latitude of location
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // get detail location from latitude and longitude
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address = "";
        address += placemark.name != null ? "${placemark.name}, " : "";
        address += placemark.street != null ? "${placemark.street}, " : "";
        address +=
            placemark.subLocality != null ? "${placemark.subLocality}, " : "";
        address += placemark.locality != null ? "${placemark.locality}, " : "";
        address += placemark.subAdministrativeArea != null
            ? "${placemark.subAdministrativeArea}, "
            : "";
        address +=
            placemark.postalCode != null ? "${placemark.postalCode}, " : "";
        address += placemark.country != null
            ? "${placemark.country}."
            : "Tidak Diketahui";
        return LocationDto(
          userLongitude: position.longitude,
          userLatitude: position.latitude,
          targetLongitude: cofiLongitude,
          targetLatitude: cofiLatitude,
          address: address,
        );
      } else {
        return LocationDto(
          userLongitude: 0,
          userLatitude: 0,
          targetLongitude: 0,
          targetLatitude: 0,
          address: "Unknown Address",
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
