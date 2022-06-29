import 'package:anakut_bank/src/features/setting/model/currency_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class CurrencyRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<CurrencyModel>> getCurrency(
      {required int page, required int rowperpage}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/currencies?page=$page&row_per_page=$rowperpage";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<CurrencyModel> currency = [];
        response.data['data'].forEach((data) {
          currency.add(CurrencyModel.fromjson(data));
        });
        print(currency);
        return currency;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
