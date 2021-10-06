import 'dart:convert';
import 'package:demo/domain/uses-case/http_client.dart';
import 'package:demo/infrastructure/helpers/enums/http_error.dart';
import 'package:http/http.dart';


class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  @override
  Future request({required String url, required String method, Map? body, Map? headers}) async {

    print(url);
    print(method);
    
    final jsonResponse = body != null ? jsonEncode(body) : null;

    print(jsonResponse);
    final defaultHeaders = headers?.cast<String, String>() ?? {}..addAll({
      'content-type': 'application/json', 
      'accept': 'application/json',
      "Access-Control_Allow_Origin": "*"
    });

    var response = Response('', 500);
    Future<Response>? futureResponse;

    try {
     switch (method) {
        case 'POST':
          futureResponse = client.post(Uri.parse(url), headers: defaultHeaders, body: jsonResponse);
          break;
        case 'GET':
          futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
          break;
        case 'PUT':
          futureResponse = client.put(Uri.parse(url), headers: defaultHeaders, body: jsonResponse);
          break;
     }

     if (futureResponse != null) response = await futureResponse.timeout(const Duration(seconds: 10));
  

    } catch (e) {
      print(e);
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

    dynamic _handleResponse(Response response) {
    switch(response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204: 
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}