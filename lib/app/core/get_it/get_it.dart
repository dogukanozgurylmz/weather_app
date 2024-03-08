import 'package:get_it/get_it.dart';
import 'package:weather_app/app/data/datasources/remote/weather_remote_datasource_impl.dart';
import 'package:weather_app/app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/app/domain/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_app/app/domain/repositories/weather_repository.dart';
import 'package:weather_app/app/presentation/home/viewmodel/home_viewmodel.dart';

final getIt = GetIt.instance;

void setupGetIT() {
  setupRepositories();
  setupDatasource();
  setupViewModel();
}

void setupRepositories() {
  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(remoteDatasource: getIt()),
  );
}

void setupDatasource() {
  getIt.registerLazySingleton<WeatherRemoteDatasource>(
    () => WeatherRemoteDatasourceImpl(),
  );
}

void setupViewModel() {
  getIt.registerLazySingleton<HomeViewModel>(
    () => HomeViewModel(),
  );
}
