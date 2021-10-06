import 'package:demo/domain/entities/account_entity.dart';
import 'package:demo/domain/entities/authentication.dart';

abstract class Authentication {
  Future<AccountEntity> auth(AuthenticationParams params);
}