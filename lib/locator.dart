import 'package:get_it/get_it.dart';
import 'package:saltcity_app/core/services/ApiService.dart';
import 'package:saltcity_app/core/services/AuthenticationService.dart';

import 'core/viewModels/authViewModel.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerFactory(() => AuthViewModel());
  sl.registerLazySingleton(() => Api());
  sl.registerLazySingleton(() => AuthenticationService());
}
