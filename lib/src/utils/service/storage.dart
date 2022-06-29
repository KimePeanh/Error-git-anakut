import 'dart:convert';

import 'package:anakut_bank/src/utils/constants/storage_key_constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final storage = FlutterSecureStorage();
  Future<void> saveToken({required String token}) async {
    await storage.deleteAll();
    await storage.write(key: 'token', value: token);
  }

  static List<String> convertStringtoListString({required String data}) {
    return json.decode(data);
  }

  Future<String?> getToken() async {
    String? token = await storage.read(key: 'token');
    if (token != null) {
      print(token);
      return token;
    } else
      return null;
  }

  Future<void> removeToken() async {
    await storage.deleteAll();
    return;
  }

    Future<void> deleteSetting() async {
    await storage.delete(key: "invoiceLogoImagePath");
    await storage.delete(key: "invoiceCompanyName");
    await storage.delete(key: "invoiceOptionalName");
    await storage.delete(key: "usdToRielRate");
    await storage.delete(key: "noteTitle");
    await storage.delete(key: "noteBody");
    await storage.delete(key: "noteImage");
    return;
  }

  Future<String> getValue(String key) async {
    String? value = await storage.read(key: key);

    return value!;
  }

  Future<void> saveValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return;
  }
  //final storage = FlutterSecureStorage();
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
