import 'package:sleek_properties_flutter/common/enums/env_enums.dart';
import 'package:sleek_properties_flutter/common/services/api/api_service.dart';
import 'package:sleek_properties_flutter/common/settings/flavours_config.dart';
import 'package:get_it/get_it.dart';
import 'package:sleek_properties_flutter/presentation/home/data/home_data_source.dart';
import 'package:sleek_properties_flutter/presentation/home/data/home_repo_impl.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/repository/home_repository.dart';
import 'package:sleek_properties_flutter/presentation/home/domain/use_case/home_use_case.dart';

final locator = GetIt.instance;

Future<void> setupLocator(Env env) async {
  locator.registerSingleton(Config(env));
  locator.registerSingleton<ApiService>(ApiService("http://127.0.0.1:8000"));

  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: locator()),
  );
  locator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(apiService: locator()),
  );
  locator.registerLazySingleton<HomeUseCase>(
    () => HomeUseCase(repository: locator()),
  );
}
