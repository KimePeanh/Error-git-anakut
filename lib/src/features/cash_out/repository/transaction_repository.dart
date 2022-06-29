import 'package:anakut_bank/src/features/cash_out/model/transaction_cash_out_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class TransactionCashOutRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<TransactionModel>> GetTransaction(
      {required int page, required int rpp}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/transactions?page=$page&row_per_page=$rpp&transaction_type=receive_money";

    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        print(response.data);
        List<TransactionModel> transaction = [];

        response.data['data'].forEach((data) {
          transaction.add(TransactionModel.fromjson(data));
        });
        return transaction;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<void> CreateCashout(
      {
      required int currency_id,
      required String transaction_reference,
      required String amount,
      required String sender_phone,
      required String receiver_phone}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/transactions/add";
    Map body = {
      "counter_id": "1",
      "currency_id": currency_id,
      "transaction_reference": transaction_reference,
      "transaction_type": "send_money",
      "amount": amount,
      "sender_phone": sender_phone,
      "receiver_phone": receiver_phone,
      "note": "Test"
    };

    try {
      Response response = await apiProvider.post(url, body, null);
      if (response.statusCode == 200) {
        print(response.data['data']['transaction_id']);
      }
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
