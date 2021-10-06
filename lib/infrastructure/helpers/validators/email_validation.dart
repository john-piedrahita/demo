import 'package:demo/infrastructure/helpers/enums/validate_error.dart';
import 'package:demo/infrastructure/helpers/field_validation.dart';
import 'package:equatable/equatable.dart';

class EmailValidation extends Equatable implements FieldValidation {
  @override
  final String field;

  @override
  List get props => [field];

  const EmailValidation(this.field);

  @override
  ValidationError? validate(Map input) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = input[field]?.isNotEmpty != true || regex.hasMatch(input[field]);

    return isValid ? null : ValidationError.invalidField;
  }
  
}