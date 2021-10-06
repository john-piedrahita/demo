import 'package:demo/infrastructure/helpers/field_validation.dart';
import 'package:demo/infrastructure/helpers/validators/email_validation.dart';
import 'package:demo/infrastructure/helpers/validators/min_length_validation.dart';
import 'package:demo/infrastructure/helpers/validators/required_filed_validation.dart';

class ValidationBuilder {
  static ValidationBuilder? _instance;
  String fieldName;
  List<FieldValidation> validations = [];

  ValidationBuilder._(this.fieldName);

  static ValidationBuilder field(String fieldName) {
    _instance = ValidationBuilder._(fieldName);
    return _instance!;
  }

  ValidationBuilder required() {
    validations.add(RequiredFieldValidation(fieldName));
    return this;
  }

  ValidationBuilder email() {
    validations.add(EmailValidation(fieldName));
    return this;
  }

  ValidationBuilder min(int size) {
    validations.add(MinLengthValidation(field: fieldName, size: size));
    return this;
  }

  List<FieldValidation> build() => validations;
}