import 'package:anakut_bank/src/utils/service/storage.dart';

import 'package:anakut_bank/src/utils/constants/storage_key_constant.dart' as key;

class UISetting {
  String? showCustomerAsList;
  UISetting({required this.showCustomerAsList});
  Future<void> saveToLocalStorage() async {
    final Storage _storageService = Storage();
    await _storageService.write(key.showCustomerAsList, showCustomerAsList);
  }
}
