import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DeleteExRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<void> DeleteExchange({required int id}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/money_exchange/delete/$id";
    try {
      Response response = await apiProvider.delete(url, null);
      if (response.statusCode == 200) {
        print(response.data);
        return;
      }
    } catch (e) {
      throw CustomException.generalException();
    }
  }
}
