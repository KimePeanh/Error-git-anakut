import 'package:anakut_bank/src/features/home/model/shop_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetShopRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<ShopModel>> GetShop({required int page,required int rowperpage}) async {
    try {
      String url =
          "https://system.anakutjob.com/anakut_bank/public/api/stores?row_per_page=$rowperpage&page=$page";
      print(url);
      Response response = await apiProvider.get(url, null, null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<ShopModel> shop = [];
        response.data["data"].forEach((data) {
          shop.add(ShopModel.fromjson(data));
        });
        print(shop);
        print("HiSjhopppppppppppppppp");
        return shop;
      }
      print(response.statusCode);
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
  // Future<List<ShopModel>> GetAllShop({required int page,required int rowperpage}) async {
  //   try {
  //     String url =
  //         "https://system.anakutjob.com/anakut_bank/public/api/stores?row_per_page=$rowperpage&page=$page";
  //     print(url);
  //     Response response = await apiProvider.get(url, null, null);
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       List<ShopModel> shop = [];
  //       response.data["data"].forEach((data) {
  //         shop.add(ShopModel.fromjson(data));
  //       });
  //       print(shop);
  //       print("HiSjhopppppppppppppppp");
  //       return shop;
  //     }
  //     print(response.statusCode);
  //     throw CustomException.generalException();
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<ShopModel> getShopById({required int id}) async {
    try {
      String url =
          "https://system.anakutjob.com/anakut_bank/public/api/stores/$id";
      print(url);
      Response response = await apiProvider.get(url, null, null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        // List<ShopModel> ShopId = [];

        // response.data["data"].forEach((data) {
        //   ShopId.add(ShopModel.fromjson(data));
        // });
        return ShopModel.fromjson(response.data["data"]);
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}
