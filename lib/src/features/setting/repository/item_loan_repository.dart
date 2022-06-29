import 'package:anakut_bank/src/features/setting/model/item_loan_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class ItemLoanRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<ItemLoanModel>> GetItemloan(
      {required int rpp, required int page}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/item_types?row_per_page=$rpp&page=$page";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ItemLoanModel> item = [];
        response.data['data'].forEach((data) {
          item.add(ItemLoanModel.fromjson(data));
        });
        print(item.length);
        return item;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
