import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _secureStorage = FlutterSecureStorage();

Future<void> storeToken(String token) async {
  await _secureStorage.write(key: 'auth_token', value: token);
}

Future<String?> getToken() async {
  return await _secureStorage.read(key: 'auth_token');
}

Future<void> removeToken() async {
  await _secureStorage.delete(key: 'auth_token');
}
