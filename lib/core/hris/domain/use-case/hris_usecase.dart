import 'package:internal_tools/core/hris/domain/entity/location_model.dart';

abstract class HrisUseCase {
  Future<LocationModel> getCurrentLocation();
}
