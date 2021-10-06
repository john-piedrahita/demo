import 'package:demo/application/factories/http/api_url_factory.dart';
import 'package:demo/application/factories/http/http_client_factory.dart';
import 'package:demo/domain/uses-case/authentication.dart';
import 'package:demo/domain/uses-case/impl/authentication_remote_impl.dart';

Authentication makeRemoteAuthentication() => RemoteAuthenticationImpl(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('login')
);