import 'package:demo/domain/uses-case/fetch_secure_cache_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageAdapter implements FetchSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  SecureStorageAdapter({ required this.secureStorage });

  @override
  Future<String?> fetch(String key) async {
    return await secureStorage.read(key: key);
  }
}