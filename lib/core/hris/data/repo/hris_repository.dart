import 'package:internal_tools/core/hris/domain/entity/location_model.dart';

abstract class IHrisRepository {
  Future<LocationModel> getCurrentLocation();
}
