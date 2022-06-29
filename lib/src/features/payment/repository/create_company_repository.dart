import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:dio/dio.dart';

class CreateCompanyRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<void> createcompany(
      {required String logo,
      required String company_name,
      required String company_code,
      required int id}) async {
    String url =
        "https://system.anakutjob.com/anakut_bank/public/api/companies/add";
    Map body = {
      "company_name": company_name,
      "company_logo": logo,
      "category_id": id,
      "company_code": company_code
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
