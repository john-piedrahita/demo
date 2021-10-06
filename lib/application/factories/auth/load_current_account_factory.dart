import 'package:demo/application/factories/auth/secure_storage_adapter_factory.dart';
import 'package:demo/domain/uses-case/impl/local_load_current_account.dart';
import 'package:demo/domain/uses-case/load_current_account.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() => LocalLoadCurrentAccoutImpl(
  fetchSecureCacheStorage: makeSecureStorageAdapter()
);