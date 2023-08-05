import 'package:get_storage/get_storage.dart';

import '../constants/app_consts.dart';

class SharedPrefs {
  final ReadWriteValue<String?> _code =
      ReadWriteValue("code${AppConsts.appName}", null);

  final ReadWriteValue<String?> _message =
      ReadWriteValue("message${AppConsts.appName}", null);

  setCode(String code) => _code.val = code;
  setMessage(String message) => _message.val = message;
  String? getCode() => _code.val;
  String? getMessage() => _message.val;
}
