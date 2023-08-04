import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phone_x/blocs/contacts/contacts_cubit.dart';

import '../constants/app_colors.dart';
import '../navigation/app_navigator.dart';
import '../shared_prefs/shared_prefs.dart';

final getIt = GetIt.instance;

class DIManager {
  DIManager._();

  static Future<void> initDI() async {
    _injectDep(AppNavigator());
    _injectDep(AppColorsController());
    await _setupSharedPreference();

    _injectDep(ContactsCubit());
  }

  static T _injectDep<T extends Object>(T dependency) {
    getIt.registerSingleton<T>(dependency);
    return getIt<T>();
  }

  static T findDep<T extends Object>() {
    return getIt<T>();
  }

  static _setupSharedPreference() async {
    await GetStorage.init();
    _injectDep(SharedPrefs());
  }

  static AppColorsController findCC() {
    return findDep<AppColorsController>();
  }
}
