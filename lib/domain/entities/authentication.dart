import 'package:equatable/equatable.dart';

class AuthenticationParams extends Equatable {

  final String email;
  final String? password;
   
  const AuthenticationParams({required this.email, this.password});

  @override
  List get props => ['email', 'password'];
}