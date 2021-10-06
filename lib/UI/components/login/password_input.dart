import 'package:demo/UI/helpers/i18n/resource.dart';
import 'package:demo/UI/helpers/ui_error.dart';
import 'package:demo/UI/pages/presenters/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<UiError?>(
      stream: presenter.passwordErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: ResourceTranslation.string.password,
            icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
            errorText: snapshot.data?.description
          ),
          obscureText: true,
          onChanged: presenter.validatePassword,
        );
      }
    );
  }

}