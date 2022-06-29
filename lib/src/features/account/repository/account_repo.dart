import 'package:anakut_bank/src/features/account/model/account_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class AccountRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<AccountModel> getUserData() async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/user/profile";
    try {
      Response response = await apiProvider.get(url, null, null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(AccountModel.fromjson(response.data["data"]));
        return AccountModel.fromjson(response.data["data"]);
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
