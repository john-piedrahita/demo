import 'package:demo/domain/entities/authentication.dart';
import 'package:demo/domain/entities/account_entity.dart';
import 'package:demo/domain/entities/domain_error.dart';
import 'package:demo/domain/entities/http_error.dart';
import 'package:demo/domain/entities/remote_account_model.dart';
import 'package:demo/domain/entities/remote_authentication.dart';
import 'package:demo/domain/uses-case/authentication.dart';
import 'package:demo/domain/uses-case/http_client.dart';

class RemoteAuthenticationImpl implements Authentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthenticationImpl({ required this.httpClient, required this.url });

  @override
  Future<AccountEntity> auth(AuthenticationParams params) async {
   final body = RemoteAuthenticationParams.fromDomain(params).toJson();

   try {
     final httpResponse = await httpClient.request(url: url, method: 'POST', body: body);
     return RemoteAccountModel.fromJson(httpResponse).toEntity();
   } on HttpError catch (error) {
     throw error == HttpError.unauthorized ? DomainError.invalidCredentials : DomainError.unexpected;
   }
   
  }
  
}