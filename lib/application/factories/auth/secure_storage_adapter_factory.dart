import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:demo/infrastructure/driven-adapters/secure_storage_adapter.dart';

SecureStorageAdapter makeSecureStorageAdapter() => SecureStorageAdapter(secureStorage: const FlutterSecureStorage());