import 'package:demo/domain/uses-case/http_client.dart';
import 'package:demo/infrastructure/driven-adapters/http.dart';
import 'package:http/http.dart';

HttpClient makeHttpAdapter() => HttpAdapter(Client());