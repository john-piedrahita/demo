import 'package:demo/UI/pages/presenters/login.dart';
import 'package:demo/UI/state/presenters/login.dart';
import 'package:demo/application/factories/auth/authentication_factory.dart';
import 'package:demo/application/factories/page/login/login_validation_factory.dart';

LoginPresenter makeGetXLoginPresenter ()  => GetxLoginPresenter(
  validation: makeLoginValidation(), 
  authentication: makeRemoteAuthentication()
);