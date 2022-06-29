
import 'package:anakut_bank/src/utils/service/storage.dart';

class AuthRepository {
  Storage _storage = Storage();
  Future<void> saveToken({required String token}) async {
    await _storage.saveToken(token: token);
  }

  Future<String?> getToken() async {
    return await _storage.getToken();
  }

  Future<void> removeToken() async {
    return await _storage.removeToken();
  }

}
