import 'package:phone_x/core/errors/base_error.dart';
import 'package:phone_x/core/states/base_state.dart';

class BaseFailState extends BaseState {
  BaseError? error;
  BaseFailState({this.error});
}
