

import 'package:anakut_bank/src/features/reciept/setting/screen/ui_setting.dart';
import 'package:anakut_bank/src/utils/service/storage.dart';
import 'package:anakut_bank/src/utils/constants/storage_key_constant.dart' as key;

class Setting {
  String? error;
  final String? invoiceLogoImagePath; //1
  final String? invoiceCompanyName; //2
  final String? invoiceOptionalName; //3
  final String? noteTile; //5
  final String? noteBody; //6
  final String? noteImage; //7
  final String? printerSize; //8/10
  final String? defaultPaymentStatus; //11
  final String? defaultSaleStatus; //12
  final String? poster; //13
  final String? homeLogo; //14
  final String? fontSize; //15//17
  final UISetting uiSetting; //20
  Future<void> saveToLocalStorage() async {
    final Storage _storageService = Storage();
    await _storageService.write(
        key.invoiceLogoImagePath, invoiceLogoImagePath); //1
    await _storageService.write(key.invoiceCompanyName, invoiceCompanyName); //2
    await _storageService.write(
        key.invoiceOptionalName, invoiceOptionalName); //3//4
    await _storageService.write(key.noteTitle, noteTile); //5
    await _storageService.write(key.noteBody, noteBody); //6
    await _storageService.write(key.noteImage, noteImage); //7
    await _storageService.write(key.printerSize, printerSize); //8//10
    await _storageService.write(
        key.defaultPaymentStatus, defaultPaymentStatus); //11
    await _storageService.write(key.defaultSaleStatus, defaultSaleStatus); //12
    await _storageService.write(key.poster, poster); //13
    await _storageService.write(key.homeLogo, homeLogo); //14
    await _storageService.write(key.fontSize, fontSize); //15 //17
    await uiSetting.saveToLocalStorage();
  }

  Setting(enabledQueue, 
      {required this.invoiceLogoImagePath,
      required this.invoiceCompanyName,
      required this.invoiceOptionalName,
      required this.noteTile,
      required this.noteBody,
      required this.noteImage,
      required this.printerSize,
      required this.defaultPaymentStatus,
      required this.defaultSaleStatus,
      required this.poster,
      required this.homeLogo,
      required this.fontSize,
      required this.uiSetting,
      this.error});
}
