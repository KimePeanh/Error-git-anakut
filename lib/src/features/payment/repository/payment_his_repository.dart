import 'package:anakut_bank/src/features/payment/model/payment_history_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class PaymentHistoryRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<PaymentHistoryModel>> getPaymentHistory(
      {required int page, required int rowperpage}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/transactions?page=$page&row_per_page=$rowperpage&transaction_type=company_service";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<PaymentHistoryModel> historylist = [];
        response.data['data'].forEach((data) {
          historylist.add(PaymentHistoryModel.fromjson(data));
        });
        print(historylist);
        return historylist;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<void> create_history(
      {required String counter_id,
      required int currency_id,
      required String amount,
      required String note}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/transactions/add";
    Map body = {
      "counter_id": counter_id,
      "currency_id": currency_id,
      "transaction_reference": "DDDD",
      "transaction_type": "company_service",
      "amount": amount,
      "note": note
    };
    try {
      Response response = await apiProvider.post(url, body, null);
      if (response.statusCode == 200) {
        print(response.data['message']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
