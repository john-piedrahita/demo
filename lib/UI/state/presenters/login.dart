import 'package:demo/UI/helpers/ui_error.dart';
import 'package:demo/UI/pages/presenters/login.dart';
import 'package:demo/UI/state/mixins/form_manager.dart';
import 'package:demo/UI/state/mixins/loading_manager.dart';
import 'package:demo/UI/state/mixins/navigation_manager.dart';
import 'package:demo/UI/state/mixins/ui_error_manager.dart';
import 'package:demo/domain/entities/authentication.dart';
import 'package:demo/domain/uses-case/authentication.dart';
import 'package:demo/infrastructure/helpers/enums/validate_error.dart';
import 'package:demo/infrastructure/helpers/validation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class GetxLoginPresenter extends GetxController with LoadingManagerGetX, FormManagerGetX, UiErrorManagerGetX, NavigationManagerGetX implements LoginPresenter {
  final Validation validation;
  final Authentication authentication;
  final _emailError = Rx<UiError?>(null);
  final _passwordError = Rx<UiError?>(null);

  GetxLoginPresenter({
    required this.validation, 
    required this.authentication
  });

  String? _email;
  String? _password;

  @override
  Stream<UiError?> get emailErrorStream => _emailError.stream;

  @override
  Stream<UiError?> get passwordErrorStream => _passwordError.stream;

  @override
  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

   @override
  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField('password');
    _validateForm();
  }

  UiError? _validateField(String field) {
    final formData = {
      'email': _email,
      'password': _password
    };

    final error = validation.validate(field: field, input: formData);

    switch (error) {
      case ValidationError.invalidField:
        return UiError.invalidField;
      case ValidationError.requiredField:
        return UiError.requiredField;
      default:
        return null;
    }
  }
  
  void _validateForm() {
    isFormValid = _emailError.value == null 
    && _passwordError.value == null
    && _email != null
    && _password != null;
  }

  @override
  Future<void> auth() async {
    try {
      mainError = null;
      isLoading = true;
      await authentication.auth(AuthenticationParams(email: _email!, password: _password!));
      navigateTo = '/home';
    } on UiError catch (e) {
      switch (e) {
        case UiError.invalidCredentials: 
          mainError = UiError.invalidCredentials;
          break;
        default:
          mainError = UiError.unexpected;
          break;
      }
      isLoading = false;
    }
  }

  @override
  Stream<String?> get navigateToStream => throw UnimplementedError();
}