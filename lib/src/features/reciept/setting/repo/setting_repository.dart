import 'package:anakut_bank/src/features/reciept/setting/model/setting_model.dart';
import 'package:anakut_bank/src/features/reciept/setting/screen/ui_setting.dart';
import 'package:anakut_bank/src/utils/constants/storage_key_constant.dart';
import 'package:anakut_bank/src/utils/service/storage.dart';

class SettingRepository {
  Storage _storageService = Storage();
  Future<Setting> getSetting() async {
    String? _invoiceLogoImagePath =
        await _storageService.read(invoiceLogoImagePath);
    String? _invoiceCompanyName =
        await _storageService.read(invoiceCompanyName);
    String? _invoiceOptionalName =
        await _storageService.read(invoiceOptionalName);
    String? _usdToRielRate = await _storageService.read(usdToRielRate);
    String? _noteTitle = await _storageService.read(noteTitle);
    String? _noteBody = await _storageService.read(noteBody);
    String? _noteImage = await _storageService.read(noteImage);
    String? _printerSize = await _storageService.read(printerSize);
    String? _secondCurrency = await _storageService.read(secondCurrency);
    String? _firstCurrency = await _storageService.read(firstCurrency);
    String? _defaultPaymentStatus =
        await _storageService.read(defaultPaymentStatus);
    String? _defaultSaleStatus = await _storageService.read(defaultSaleStatus);
    String? _poster = await _storageService.read(poster);
    String? _requestDelivery = await _storageService.read(requestDelivery);
    /////////////////////
    String? _canAddProduct = await _storageService.read(canAddProduct);
    String? _canEditProduct = await _storageService.read(canEditProduct);
    String? _canDeleteProduct = await _storageService.read(canDeleteProduct);
    String? _canViewSummaryReport =
        await _storageService.read(canViewSummaryReport);
    String? _viewOnline = await _storageService.read(viewOnline);
    String? _homeLogo = await _storageService.read(homeLogo);
    String? _partialPayment = await _storageService.read(partialPayment);
    String? _fontSize = await _storageService.read(fontSize);
    String? _queue = await _storageService.read(queue);
    String? _enabledQueue = await _storageService.read(enabledQueue);
    /////App Module
    String? _enabledCounter = await _storageService.read(enabledCounter);
    String? _enabledCustomer = await _storageService.read(enabledCustomer);
    String? _enabledExpense = await _storageService.read(enabledExpense);
    String? _enabledInventory = await _storageService.read(enabledInventory);
    String? _enabledReport = await _storageService.read(enabledReport);
    String? _enabledLiveSystem = await _storageService.read(enabledLiveSystem);
    /////////
    String? _taxId = await _storageService.read(taxId);
    String? _taxCode = await _storageService.read(taxCode);
    String? _taxName = await _storageService.read(taxName);
    String? _taxRate = await _storageService.read(taxRate);

    //category
    String? _categoryAdd = await _storageService.read(categoryAdd);
    String? _categoryEdit = await _storageService.read(categoryEdit);
    String? _categoryDelete = await _storageService.read(categoryDelete);

    //expense
    String? _expenseAdd = await _storageService.read(expenseAdd);
    String? _expenseEdit = await _storageService.read(expenseEdit);
    String? _expenseDelete = await _storageService.read(expenseDelete);

    //unit
    String? _unitAdd = await _storageService.read(unitAdd);
    String? _unitEdit = await _storageService.read(unitEdit);
    String? _unitDelete = await _storageService.read(unitDelete);

    //location
    String? _sendSaleLocation = await _storageService.read(sendSaleLocation);
    //
    String? _showCustomerAsList =
        await _storageService.read(showCustomerAsList);

    if (_firstCurrency == null) {
      _firstCurrency = "USD";
    }
    //print("${double.parse(_usdToRielRate)}");

    return Setting(
      enabledQueue,
      invoiceLogoImagePath: null,
      invoiceCompanyName: null,
      invoiceOptionalName: null,
      noteTile: null,
      noteBody: null,
      noteImage: null,
      printerSize: null,
      defaultPaymentStatus: null,
      defaultSaleStatus: null,
      poster: null,
      homeLogo: null,
      fontSize: null,
      uiSetting: UISetting(showCustomerAsList: _showCustomerAsList),
    );
  }

  Future<void> saveSetting({required Setting setting}) async {
    await setting.saveToLocalStorage();
  }
}
