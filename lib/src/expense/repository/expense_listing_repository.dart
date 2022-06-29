import 'package:anakut_bank/src/expense/models/expense.dart';
import 'package:anakut_bank/src/features/exchnage/model/exchnage_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class ExpenseListingRepository {
  Future<List<ExchangeHistoryModel>> getExpenseList(
      {required int? page,
      required int rowPerPage,
      required String? startDate,
      required String? endDate}) async {
    try {
      final ApiProvider apiProvider = ApiProvider();
      String url =
          "https://system.anakutjob.com/anakut_bank/public/api/money_exchange?page=$page&row_per_page=$rowPerPage&from_date=$startDate&to_date=$endDate";
      print(url);
      Response response = await apiProvider.get(url, null, null);

      if (response.statusCode == 200) {
        print(response.data);
        List<ExchangeHistoryModel> expenses = [];
        response.data["data"].forEach((val) {
          expenses.add(ExchangeHistoryModel.fromjson(val));
        });

        return expenses;
      }
      throw CustomException.generalException();
    } catch (e) {
      throw e;
    }
  }
}

// class ExpenseListByCategoryRepo extends ExpenseListingRepository {
//   @override
//   Future<List<Expense>> getExpenseList(
//       {@required int page,
//       @required int rowPerPage,
//       @required additionalArg}) async {
//     if (additionalArg is String)
//       return await super.operate(
//           urlSuffix:
//               "/expenses?row_per_page=$rowPerPage&page=$page&category_id=$additionalArg&store_code=${dotenv.env['storeCode']}",
//           page: page,
//           rowPerPage: rowPerPage);
//     else
//       throw CustomException(message: "Invalid argument.");
//   }
// }

// class ExpenseListBySubCategoryRepo extends ExpenseListingRepository {
//   @override
//   Future<List<Expense>> getExpenseList(
//       {@required int page,
//       @required int rowPerPage,
//       @required additionalArg}) async {
//     if (additionalArg is String)
//       return await super.operate(
//           urlSuffix:
//               "/expenses?row_per_page=$rowPerPage&page=$page&subid=$additionalArg&store_code=${dotenv.env['storeCode']}",
//           page: page,
//           rowPerPage: rowPerPage);
//     else
//       throw CustomException(message: "Invalid argument.");
//   }
// }

// class ExpenseListByPromotionRepo extends ExpenseListingRepository {
//   @override
//   Future<List<Expense>> getExpenseList(
//       {@required int page,
//       @required int rowPerPage,
//       @required additionalArg}) async {
//     return await super.operate(
//         urlSuffix:
//             "/expenses?page=$page&row_per_page=$rowPerPage&type=promotion&store_code=${dotenv.env['storeCode']}",
//         page: page,
//         rowPerPage: rowPerPage);
//   }
// }
