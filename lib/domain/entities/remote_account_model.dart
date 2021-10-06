import 'package:demo/domain/entities/account_entity.dart';
import 'package:demo/infrastructure/helpers/enums/http_error.dart';

class RemoteAccountModel {
  final String accessToken;

  RemoteAccountModel({ required this.accessToken });

  factory RemoteAccountModel.fromJson(Map json) {
    if (!json.containsKey('accessToken')) throw HttpError.invalidData;
    
    return RemoteAccountModel(accessToken: json['accessToken']);
  }

  AccountEntity toEntity() => AccountEntity(token: accessToken);
 }