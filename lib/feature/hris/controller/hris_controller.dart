import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internal_tools/core/hris/domain/entity/location_model.dart';
import 'package:internal_tools/core/hris/domain/use-case/hris_interactor.dart';

Provider<HrisInteractor> hrisInteractor = Provider<HrisInteractor>(
  (ref) => HrisInteractor(),
);

FutureProvider<LocationModel> hrisController = FutureProvider<LocationModel>(
  (ref) => ref.watch(hrisInteractor).getCurrentLocation(),
);
