
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class EditExchangeRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<void> EditExchange(
      {required int currency_in,
      required int currency_out,
      required double rate,
      required double amount_in,
      required double amount_out,
      required int id}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/money_exchange/edit/$id";
    Map body = {
      "rate_type": "rate_in",
      "currency_in": currency_in,
      "currency_out": currency_out,
      "rate": rate,
      "amount_in": amount_in,
      "amount_out": amount_out
    };
    try {
      Response response = await apiProvider.put(url, body);
      if (response.statusCode == 200) {
        print(response.data);
        return;
      }
    } catch (e) {
      print(e.toString());
      throw CustomException.generalException();
      
    }
  }
}
