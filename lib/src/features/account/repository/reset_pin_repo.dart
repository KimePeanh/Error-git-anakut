import 'dart:convert';

import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class ResetPinRepo {
  ApiProvider apiProvider = ApiProvider();

  Future<String> Resetpin(
      {required String old_pin, required String new_pin}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/user/change_pin";
    print(url);
    Map body = {"old_pin": old_pin, "new_pin": new_pin};
    // print(object)
    var auth = 'Bearer' + base64Encode(utf8.encode('$old_pin:$new_pin'));
    print(auth);

    try {
      Response response = await apiProvider.post(
          url, body, Options(headers: <String, String>{'authorization': auth}));
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200 && response.data["code"] == 0) {
        print(response.data);
        return response.data['message'];
        // return response.data["token"];
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
