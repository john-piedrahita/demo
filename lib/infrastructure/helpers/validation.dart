import 'enums/validate_error.dart';

abstract class Validation {
  ValidationError? validate({required String field, required Map input });
}
