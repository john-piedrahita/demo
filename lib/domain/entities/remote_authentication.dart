import 'package:demo/domain/entities/authentication.dart';

class RemoteAuthenticationParams {
  final String email;
  final String? password;

  RemoteAuthenticationParams({ required this.email, this.password });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) => RemoteAuthenticationParams(email: params.email, password: params.password);

  Map toJson() => { 'email': email, 'password': password };
}