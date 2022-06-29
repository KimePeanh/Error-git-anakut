import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CreateRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<int> CreateExchange(
      {required String rate_type,
      required int counter_id,
      required double currency_in,
      required double currency_out,
      required double rate,
      required double amount_in,
      required double amount_out}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/money_exchange/add";
    Map body = {
      "rate_type": rate_type,
      "counter_id": counter_id,
      "currency_in": currency_in,
      "currency_out": currency_out,
      "rate": rate,
      "amount_in": amount_in,
      "amount_out": amount_out
    };
    try {
      Response response = await apiProvider.post(url, body, null);
      if (response.statusCode == 200) {
        int money_exchange_id = response.data['data']['money_exchange_id'];
        print(money_exchange_id.toString());
        print(response.data["message"]);
        return money_exchange_id;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }


}




