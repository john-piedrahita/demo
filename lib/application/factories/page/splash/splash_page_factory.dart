import 'package:demo/UI/pages/splash_page.dart';
import 'package:demo/application/factories/page/splash/splash_presenter_factory.dart';
import 'package:flutter/material.dart';

Widget makeSplashPage() => SplashPage(presenter: makeGetXSplashPresenter());