import 'package:anakut_bank/src/features/transfer/model/transfer_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class OverseaRepository {
  ApiProvider apiProvider = ApiProvider();
  Future<List<TransferModel>> getname({required int page}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/home_partners?page=$page&row_per_page=12";
    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<TransferModel> name = [];
        response.data["data"].forEach((data) {
          name.add(TransferModel.fromjson(data));
        });
        print(name);
        print("Hppnnnnnnpp");
        return name;
      }
      print(response.statusCode);
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
