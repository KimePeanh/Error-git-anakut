import 'dart:convert';

import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<ShopModel>> SearchShop(
      {required int item, required String query}) async {
    try {
      String url =
          "https://system.anakutjob.com/anakut_bank/public/api/stores?row_per_page=12&page=$item&search=$query";
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ShopModel> products = [];
        response.data["data"].forEach((val) {
          products.add(ShopModel.fromjson(val));
        });

        return products;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
