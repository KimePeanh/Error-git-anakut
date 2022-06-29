
import 'package:anakut_bank/src/utils/constants/storage_key_constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final storage = FlutterSecureStorage();
  Future<void> deleteAll() async {
    await storage.deleteAll();
    return;
  }

  Future<void> delete(StorageKeyConstant key) async {
    await storage.delete(key: key.name);
    return;
  }

  Future<String?> read(StorageKeyConstant key) async {
    try {
      String? value = await storage.read(key: key.name);

      return value;
    } catch (e) {
      print(e.toString());
      storage.deleteAll();
      return null;
    }
  }

  Future<void> write(StorageKeyConstant key, String? value) async {
    await storage.write(key: key.name, value: value);
    return;
  }
}
