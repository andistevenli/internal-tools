import 'package:internal_tools/core/hris/data/dto/location_dto.dart';
import 'package:internal_tools/core/hris/domain/entity/location_model.dart';

LocationModel locationMapper(LocationDto location) {
  return LocationModel(
    userLongitude: location.userLongitude,
    userLatitude: location.userLatitude,
    targetLongitude: location.targetLongitude,
    targetLatitude: location.targetLatitude,
    address: location.address,
  );
}
