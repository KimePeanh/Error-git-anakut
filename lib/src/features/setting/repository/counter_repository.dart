import 'package:anakut_bank/src/features/setting/model/counter_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class CounterRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<CounterModel>> getCounter({required int page}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/counters?page=$page&row_per_page=12";

    try {
      Response response = await apiProvider.get(url, null, null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<CounterModel> Counter = [];
        response.data['data'].forEach((data) {
          Counter.add(CounterModel.formjson(data));
        });
        // List<Counter_Balance_Model> CounterBalance = [];
        // response.data['data']['counter_balance'].forEach((data) {
        //   CounterBalance.add(Counter_Balance_Model.fromjson(data));
        // });
        //  print(CounterBalance.length);
        print(Counter.length);
        return Counter;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  // Future<List<Counter_Balance_Model>> getCounterBalance(
  //     {required int page}) async {
  //   String url =
  //       "https://system.anakutjob.com/anakut_bank/public/api/counters?page=$page&row_per_page=12";

  //   try {
  //     Response response = await apiProvider.get(url, null, null);
  //     if (response.statusCode == 200) {
  //       // List<CounterModel> Counter = [];
  //       // response.data['data'].forEach((data) {
  //       //   Counter.add(CounterModel.formjson(data));
  //       // });
  //       List<CounterModel> Counter = [];
  //       List<Counter_Balance_Model> CounterBalance = [];
  //       response.data['data'].forEach((data) {
  //         Counter.add(CounterModel.formjson(data));
  //       });
  //       for (int i = 0; i < Counter.length; i++) {
  //         response.data['data']['counter_balance'].forEach((data) {
  //           CounterBalance.add(Counter_Balance_Model.fromjson(data));
  //         });
  //         print(CounterBalance.length);
  //       }
        
  //       return CounterBalance;
  //     }
  //     throw CustomException.generalException();
  //   } catch (e) {
  //     print(e.toString());
  //     throw e.toString();
  //   }
  // }
}
