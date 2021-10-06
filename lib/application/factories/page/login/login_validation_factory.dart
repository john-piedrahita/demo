import 'package:demo/application/builders/validation_builder.dart';
import 'package:demo/application/composites/validation_composite.dart';
import 'package:demo/infrastructure/helpers/field_validation.dart';
import 'package:demo/infrastructure/helpers/validation.dart';

Validation makeLoginValidation () => ValidationComposite(makeLoginValidations());

List<FieldValidation> makeLoginValidations() => [
  ...ValidationBuilder.field('email').required().email().build(),
  ...ValidationBuilder.field('passwprd').required().min(3).build()
];