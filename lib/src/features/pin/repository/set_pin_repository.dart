import 'dart:convert';

import 'package:anakut_bank/src/features/login/model/login_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class SetPinRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<String> setPin({required String pin, required String otp}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/user/set_pin";
    Map body = {"pin": pin, "verified_text": otp};
    var auth = 'Bearer' + base64Encode(utf8.encode('$pin:$otp'));
    try {
      Response response = await apiProvider.post(
          url, body, Options(headers: <String, String>{'authorization': auth}));
      if (response.statusCode == 200) {
        return response.data['message'];
      }else{
        throw response.data['message'];
      }
    } catch (e) {
      throw e;
    }
  }
}
