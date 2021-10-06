import 'package:demo/UI/mixins/navigation_manager.dart';
import 'package:demo/UI/pages/presenters/splash_presenter.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget with NavigationManager {
  final SplashPresenter presenter;

  const SplashPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();

    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body: Builder(builder: (context) {
        handleNavigation(presenter.navigationToStream, clear: true);

        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
  
}