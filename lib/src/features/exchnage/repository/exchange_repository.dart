import 'package:anakut_bank/src/features/exchnage/model/exchnage_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class ExchangeRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<List<ExchangeModel>> getCurrency(
      {required int page, required int rowperpage}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/exchange_rates?page=$page&row_per_page=$rowperpage";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ExchangeModel> rate = [];
        response.data["data"].forEach((data) {
          rate.add(ExchangeModel.fromjson(data));
        });
        print(rate);
        return rate;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<List<ExchangeHistoryModel>> getExchangeHistory(
      {required int page,
      required int rowperpage,
      required String start,
      required String end}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/money_exchange?page=$page&row_per_page=$rowperpage&from_date=$start&to_date=$end";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ExchangeHistoryModel> HistoryList = [];
        response.data['data'].forEach((data) {
          HistoryList.add(ExchangeHistoryModel.fromjson(data));
        });
        print(HistoryList.length);
        return HistoryList;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
