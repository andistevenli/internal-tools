import 'package:get_it/get_it.dart';
import 'package:internal_tools/core/hris/domain/use-case/hris_interactor.dart';

final featureInject = GetIt.instance;

void setupFeatureInjector() {
  featureInject.registerLazySingleton(
    () => HrisInteractor(),
  );
}
