import 'base_validator.dart';

class RequiredValidator extends BaseValidator {
  @override
  String getMessage() {
    return 'Required';
  }

  @override
  bool validate(String? value) {
    return value != null && value.isNotEmpty;
  }
}
