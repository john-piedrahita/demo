import 'package:demo/UI/helpers/i18n/translation.dart';

class EnUsa implements Translation {
  @override
  String get email => '';

  @override
  String get login => 'Login';
  
  @override
  String get msgEmailInUse => 'The email is in use';

  @override
  String get msgInvalidCredentials => 'Invalid credentials';

  @override
  String get msgInvalidField => 'Invalid field';

  @override
  String get msgRequiredField => 'Required field';

  @override
  String get msgUnexpectedError => 'Unexpected error';

  @override
  String get password => 'Password';

  @override
  String get wait => 'Loading...';

  @override
  String get enter => 'Sign Up';
  
}