import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

mixin NavigationManagerGetX on GetxController {
  final _navigateTo = Rx<String?>(null);
  Stream<String?> get navigateToStream => _navigateTo.stream;
  set navigateTo(String value) => _navigateTo.subject.add(value);
}