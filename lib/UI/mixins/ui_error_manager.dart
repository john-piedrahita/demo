import 'package:demo/UI/components/error_message.dart';
import 'package:demo/UI/helpers/ui_error.dart';
import 'package:flutter/material.dart';

mixin UiErrorManager {
  void handleMainError(BuildContext context, Stream<UiError?> stream) {
    stream.listen((error) { 
      if (error != null) {
        showErrorMessage(context, error.description);
      }
    });
  }
}