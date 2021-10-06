import 'package:demo/UI/components/login/email_input.dart';
import 'package:demo/UI/components/login/login_button.dart';
import 'package:demo/UI/components/login/password_input.dart';
import 'package:demo/UI/mixins/keyboard_manager.dart';
import 'package:demo/UI/mixins/loading_manager.dart';
import 'package:demo/UI/mixins/navigation_manager.dart';
import 'package:demo/UI/mixins/ui_error_manager.dart';
import 'package:demo/UI/pages/presenters/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatelessWidget with KeyboardManager, LoadingManager, UiErrorManager, NavigationManager {
  final LoginPresenter presenter;

  LoginPage(this.presenter, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          handleLoading(context, presenter.isLoadingStream);
          handleMainError(context, presenter.mainErrorStream);
          

          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: ListenableProvider(
                      create: (_) => presenter,
                      child: Form(
                        child: Column(
                          children: const <Widget>[
                            EmailInput(),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 32),
                              child: PasswordInput(),
                            ),
                            LoginButton()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}