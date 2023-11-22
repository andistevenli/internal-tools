import 'package:internal_tools/core/hris/data/data-source/location/location_data_source.dart';
import 'package:internal_tools/core/hris/data/dto/location_dto.dart';
import 'package:internal_tools/core/hris/data/mapper/location_mapper.dart';
import 'package:internal_tools/core/hris/data/repo/hris_repository.dart';
import 'package:internal_tools/core/hris/domain/di/domain_injector.dart';
import 'package:internal_tools/core/hris/domain/entity/location_model.dart';

class HrisRepositoryImpl implements IHrisRepository {
  @override
  Future<LocationModel> getCurrentLocation() async {
    try {
      final LocationDto location =
          await domainInjet<LocationDataSource>().getCurrentLocation();
      final LocationModel locationModel = locationMapper(location);
      return locationModel;
    } catch (e) {
      throw Exception(e);
    }
  }
}
