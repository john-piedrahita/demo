import 'enums/validate_error.dart';

abstract class FieldValidation {
  String get field;
  ValidationError? validate(Map input);
}