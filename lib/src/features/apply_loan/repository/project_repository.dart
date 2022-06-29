import 'package:anakut_bank/src/features/apply_loan/model/project_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class ProjectRepository {
  ApiProvider apiProvider = ApiProvider();
  int total = 0;
  Future<List<ProjectModel>> getproject() async {
    String url = "https://system.anakutjob.com/anakut_bank/public/api/projects";

    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ProjectModel> project = [];
        response.data['data'].forEach((data) {
          project.add(ProjectModel.formjson(data));
        });

        return project;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }

  Future<List<ItemtypeModel>> getitemtype(
      {required int rpp, required int page}) async {
    String url =
        'https://system.anakutjob.com/anakut_bank/public/api/item_types?row_per_page=$rpp&page=$page';

    try {
      Response response = await apiProvider.get(url, null, null);
      if (response.statusCode == 200) {
        List<ItemtypeModel> item_list = [];
        response.data['data'].forEach((data) {
          item_list.add(ItemtypeModel.fromjson(data));
        });

        total = response.data['total'];
        return item_list;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
