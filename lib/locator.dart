import 'package:get_it/get_it.dart';

import 'core/viewModels/authViewModel.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerFactory(() => AuthViewModel());
}
