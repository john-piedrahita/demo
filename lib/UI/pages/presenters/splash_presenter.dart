import 'package:flutter/material.dart';

abstract class SplashPresenter implements Listenable {
  Stream<String?> get navigationToStream;
  Future<void> checkAccount({ int durationInSeconds });
}