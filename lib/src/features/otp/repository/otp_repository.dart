import 'dart:convert';

import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:dio/dio.dart';

class otpRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<String> ConfirmOTP() async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/user/verified_text/resend";
    Map body = {"create_type": "resend", "type": "google"};
    

    try {
      Response response = await apiProvider.post(
          url, body, null);
      print(response.data);
      if (response.statusCode == 200) {
        print(response.data['message'].toString());
        return response.data['message'];
      } else {
        throw response.data['message'];
      }
    } catch (e) {
      throw e;
    }
  }
}
