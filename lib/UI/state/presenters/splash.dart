import 'package:demo/UI/pages/presenters/splash_presenter.dart';
import 'package:demo/UI/state/mixins/navigation_manager.dart';
import 'package:demo/domain/uses-case/load_current_account.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetXSplashPresenter extends GetxController with NavigationManagerGetX implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;

  GetXSplashPresenter({ required this.loadCurrentAccount });
  
  @override
  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));

    try {
      await loadCurrentAccount.load();
      navigateTo = '/home';
    } catch (error) {
      navigateTo = '/login';
    }
  }

  @override
  Stream<String?> get navigationToStream => throw UnimplementedError();
}