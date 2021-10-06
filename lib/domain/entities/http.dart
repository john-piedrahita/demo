import 'package:equatable/equatable.dart';

class HttpParams extends Equatable {

  final String url; 
  final String method; 
  final Map? body; 
  final Map? headers;

  const HttpParams({required this.url, required this.method, this.body, this.headers});

  @override
  List get props => ['url', 'method', 'body', 'headers'];
}