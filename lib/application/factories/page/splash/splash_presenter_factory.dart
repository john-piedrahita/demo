import 'package:demo/UI/pages/presenters/splash_presenter.dart';
import 'package:demo/UI/state/presenters/splash.dart';
import 'package:demo/application/factories/auth/load_current_account_factory.dart';

SplashPresenter makeGetXSplashPresenter() => GetXSplashPresenter(
  loadCurrentAccount: makeLocalLoadCurrentAccount()
);