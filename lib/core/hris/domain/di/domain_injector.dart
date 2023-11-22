import 'package:get_it/get_it.dart';
import 'package:internal_tools/core/hris/data/data-source/location/location_data_source.dart';
import 'package:internal_tools/core/hris/domain/repo/hris_repository_impl.dart';

final domainInjet = GetIt.instance;

void setupDomainInjector() {
  domainInjet.registerLazySingleton(
    () => LocationDataSource(),
  );
  domainInjet.registerLazySingleton(
    () => HrisRepositoryImpl(),
  );
}
