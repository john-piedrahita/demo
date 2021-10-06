import 'package:demo/UI/helpers/i18n/resource.dart';
import 'package:demo/UI/helpers/ui_error.dart';
import 'package:demo/UI/pages/presenters/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<UiError?>(
      stream: presenter.emailErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: ResourceTranslation.string.email,
            icon: Icon(Icons.email, color: Theme.of(context).primaryColorLight),
            errorText: snapshot.data?.description
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: presenter.validateEmail,
        );
    });
  }
}