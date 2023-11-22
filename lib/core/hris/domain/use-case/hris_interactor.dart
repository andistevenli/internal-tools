import 'package:internal_tools/core/hris/domain/di/domain_injector.dart';
import 'package:internal_tools/core/hris/domain/entity/location_model.dart';
import 'package:internal_tools/core/hris/domain/repo/hris_repository_impl.dart';
import 'package:internal_tools/core/hris/domain/use-case/hris_usecase.dart';

class HrisInteractor implements HrisUseCase {
  @override
  Future<LocationModel> getCurrentLocation() async {
    try {
      return await domainInjet<HrisRepositoryImpl>().getCurrentLocation();
    } catch (e) {
      throw Exception(e);
    }
  }
}
