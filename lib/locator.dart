import 'package:get_it/get_it.dart';

import 'core/viewmodel/base_model.dart';
import 'core/viewmodel/music_provider.dart';
import 'core/viewmodel/settings_model.dart';

GetIt locator = GetIt();

void setLocator() {
  //view models
  locator.registerLazySingleton(() => MusicModel());
  locator.registerLazySingleton(() => SettingsModel());
  locator.registerLazySingleton(() => BaseModel());

  //custom provider for specific purpose
}
