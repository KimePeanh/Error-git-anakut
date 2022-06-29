import 'dart:async';
import 'package:anakut_bank/src/features/reciept/setting/model/setting_model.dart';
import 'package:anakut_bank/src/features/reciept/setting/repo/setting_repository.dart';
import 'package:anakut_bank/src/features/reciept/setting/screen/ui_setting.dart';
import 'package:anakut_bank/src/utils/constants/storage_key_constant.dart';
import 'package:bloc/bloc.dart';

import 'setting_event.dart';

class SettingBloc extends Bloc<SettingEvent, Setting> {
  SettingBloc()
      : super(Setting(
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
          uiSetting: UISetting(showCustomerAsList: "true"),
        ));
  SettingRepository _settingRepository = SettingRepository();
  @override
  Stream<Setting> mapEventToState(SettingEvent event) async* {
    if (event is InitializeStarted) {
      try {
        Setting setting = await _settingRepository.getSetting();
       
        yield setting;
      } catch (_) {
        Setting setting = state;
        setting.error = _.toString();
        yield setting;
      }
    }
    if (event is SetStarted) {
      try {
        print("before save setting");
        await _settingRepository.saveSetting(setting: event.setting);
        print("save setting succed");
        // print(event.setting.usdToRielRate);
        print("assigned cart usdtoriel rate to event setting");
        Setting setting = await _settingRepository.getSetting();
        print("get setting succed");
        yield setting;
      } catch (_) {
        print(_.toString());
        Setting setting = state;
        setting.error = _.toString();
        yield setting;
      }
    }
  }
}
