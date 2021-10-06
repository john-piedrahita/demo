import 'package:demo/infrastructure/helpers/enums/validate_error.dart';
import 'package:demo/infrastructure/helpers/field_validation.dart';
import 'package:demo/infrastructure/helpers/validation.dart';

class ValidationComposite implements Validation {
  final List<FieldValidation> validations;

  ValidationComposite(this.validations);

  @override
  ValidationError? validate({required String field, required Map input}) {
    ValidationError? error;

    for (final validation in validations.where((v) => v.field == field)) {
      error = validation.validate(input);
      if (error != null) {
        return error;
      }
    }

    return error;
  }
  
}