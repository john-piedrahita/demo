import 'package:equatable/equatable.dart';

import 'package:demo/infrastructure/helpers/enums/validate_error.dart';
import 'package:demo/infrastructure/helpers/field_validation.dart';

class RequiredFieldValidation extends  Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const RequiredFieldValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    input[field]?.isNotEmpty == true ? null : ValidationError.requiredField;
  }
}