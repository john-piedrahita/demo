import 'package:demo/domain/entities/http.dart';

abstract class HttpClientAdapter {
  Future<dynamic> request(HttpParams params);
}