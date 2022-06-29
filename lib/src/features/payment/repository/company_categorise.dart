

import 'package:anakut_bank/src/features/payment/model/cate_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class CompanyCateRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<CompanyCateModel>> getCompanyCate(
      {required int page, required int rpp}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/company_categories?page=$page&row_per_page=$rpp";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<CompanyCateModel> cate = [];
        response.data['data'].forEach((data) {
          cate.add(CompanyCateModel.fromjson(data));
        });
        return cate;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<List<CateDetail>> getCatebyId(
      {required int page, required int rrp, required int category_id}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/companies?page=$page&row_per_page=$rrp&category_id=$category_id";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<CateDetail> Detail = [];
        response.data['data'].forEach((data) {
          Detail.add(CateDetail.fromjson(data));
        });
        return Detail;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<void> DeleteCompany({required int id}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/companies/delete/$id";
    try {
      Response response = await apiProvider.delete(url, null);
      if (response.statusCode == 200) {
        print(response.data['message']);
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<void> EditCompany(
      {required int id,
      required String company_name,
      required String company_logo,
      required int category_id,
      required String company_code}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/companies/edit/$id";
    Map body = {
      "company_name": company_name,
      "company_logo": company_logo,
      "category_id": category_id,
      "company_code": company_code
    };
    try {
      Response response = await apiProvider.put(url, body);
      if (response.statusCode == 200) {
        print(response.data['message']);
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
