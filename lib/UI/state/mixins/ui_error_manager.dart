import 'package:demo/UI/helpers/ui_error.dart';
import 'package:get/get.dart';

mixin UiErrorManagerGetX on GetxController {
  final _mainError = Rx<UiError?>(null);
  Stream<UiError?> get mainErrorStream => _mainError.stream;
  set mainError(UiError? value) => _mainError.value = value;
}