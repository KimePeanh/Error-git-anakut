import 'package:anakut_bank/src/features/recievce/model/transaction_history_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class TransactionRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<TransctionHistoryModel>> getTransacIn(
      {required int page, required int rpp}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/transactions?page=$page&row_per_page=$rpp&transaction_type=receive_money";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<TransctionHistoryModel> his = [];
        response.data['data'].forEach((data) {
          his.add(TransctionHistoryModel.fromjson(data));
        });
        print(his.length);
        return his;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
