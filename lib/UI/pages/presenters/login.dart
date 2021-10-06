import 'package:demo/UI/helpers/ui_error.dart';
import 'package:flutter/material.dart';

abstract class LoginPresenter implements Listenable {
  Stream<UiError?> get emailErrorStream;
  Stream<UiError?> get passwordErrorStream;
  Stream<UiError?> get mainErrorStream;
  Stream<String?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  void validateEmail(String email);
  void validatePassword(String password);
  Future<void> auth();
}