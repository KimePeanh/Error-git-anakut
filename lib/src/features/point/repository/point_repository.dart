import 'package:anakut_bank/src/features/point/model/point_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PointRepository {
  ApiProvider apiProvider = ApiProvider();
  int total = 0;
  Future<List<PointModel>> getmypoint(
      {required int rpp, required int page}) async {
    
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/my/stores?row_per_page=$rpp&page=$page";

    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<PointModel> point = [];
        response.data['data'].forEach((data) {
          point.add(PointModel.fromjson(data));
        });
        print(point.length);
        total = response.data['total'];
        return point;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
