import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String? token;

  const AccountEntity({this.token});

  @override
  List<dynamic> get props => ['token'];
}