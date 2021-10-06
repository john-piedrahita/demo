import 'package:demo/domain/entities/account_entity.dart';
import 'package:demo/domain/entities/domain_error.dart';
import 'package:demo/domain/uses-case/fetch_secure_cache_storage.dart';
import 'package:demo/domain/uses-case/load_current_account.dart';

class LocalLoadCurrentAccoutImpl implements LoadCurrentAccount {
  final FetchSecureCacheStorage fetchSecureCacheStorage;

  LocalLoadCurrentAccoutImpl({ required this.fetchSecureCacheStorage });

  @override
  Future<AccountEntity> load() async {
   try {
     final token = await fetchSecureCacheStorage.fetch('token');
     if (token == null) throw Error();
     return AccountEntity(token: token);
   } catch (error) {
     throw DomainError.unexpected;
   }
  }
}