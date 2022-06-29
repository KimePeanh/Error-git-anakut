import 'package:anakut_bank/src/features/notification/model/notification_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';

class NotificationRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<NotificationModel>> getNotification() async {
    try {
      String url =
          "https://system.anakutjob.com/anakut_bank/public/api/notifications?row_per_page=12&page=1";
      Response response = await apiProvider.get(url, null, null);
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<NotificationModel> NotiList = [];
        response.data["data"].forEach((data) {
          NotiList.add(NotificationModel.fromjson(data));
        });
        return NotiList;
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
