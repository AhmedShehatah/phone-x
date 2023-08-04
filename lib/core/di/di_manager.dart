import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DIManager {
  DIManager._();

  static Future<void> initDI() async {}

  static T _injectDep<T extends Object>(T dependency) {
    getIt.registerSingleton<T>(dependency);
    return getIt<T>();
  }

  static T findDep<T extends Object>() {
    return getIt<T>();
  }

  // static _setupSharedPreference() async {
  //   await GetStorage.init();
  //   _injectDep(SharedPrefs());
  // }
}
