import 'package:demo/UI/helpers/i18n/resource.dart';

enum UiError {
  requiredField,
  invalidField,
  unexpected,
  invalidCredentials,
  emailInUse
}

extension UiErrorExtension on UiError {
  String get description {
    switch (this) {
      case UiError.requiredField:
        return ResourceTranslation.string.msgRequiredField;
      case UiError.invalidField:
        return ResourceTranslation.string.msgInvalidField;
      case UiError.invalidCredentials: 
        return ResourceTranslation.string.msgInvalidCredentials;
      case UiError.emailInUse:
        return ResourceTranslation.string.msgEmailInUse;
      default:
        return ResourceTranslation.string.msgUnexpectedError;
    }
  }
}