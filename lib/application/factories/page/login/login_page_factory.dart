import 'package:demo/UI/pages/login_page.dart';
import 'package:demo/application/factories/page/login/login_presenter_factory.dart';
import 'package:flutter/material.dart';

Widget makeLoginPage() => LoginPage(makeGetXLoginPresenter());