import 'package:anakut_bank/src/features/reciept/model/reciept_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class RecieptRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<RecieptModel> getRecieptbyId({required int id}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/money_exchange/$id";
    try {
      Response response = await apiProvider.get(url, null, null);
      print(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        // List<RecieptModel>? ListData;
        return RecieptModel.fromjson(response. data["data"]);
        // response.data["data"].forEach((data) {
        //   ListData!.add(RecieptModel.fromjson(data));
        // });
        // return ListData!;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}

// class ReceiptRepository {
//   ApiProvider apiProvider = ApiProvider();

//   Future<List<RecieptModel>> getRecieptbyId({required int id}) async {
//     String url =
//         "https://system.anakutjob.com/anakut_bank/public/api/money_exchange/$id";
//     try {
//       Response response = await apiProvider.get(url, null, null);
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         List<RecieptModel> listData = [];
//         response.data['']
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
