import 'dart:convert';

import 'package:anakut_bank/src/features/login/model/login_model.dart';
import 'package:anakut_bank/src/utils/service/api_provider.dart';
import 'package:anakut_bank/src/utils/service/custom_expection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginRepository {
  ApiProvider apiProvider = ApiProvider();
  String mainurl = "https://system.anakutjob.com/anakut_bank/public/api";

  Future<UserModel> login(
      {required String phone, required String password}) async {
    String url = mainurl + "/login";
    print(url);
    Map body = {"phone": phone, "password": password};
    var auth = 'Bearer' + base64Encode(utf8.encode('$phone:$password'));
    print(auth);

    try {
      Response response = await apiProvider.post(
          url, body, Options(headers: <String, String>{'authorization': auth}));
      if (response.statusCode == 200 && response.data["code"] == 0) {
        return UserModel.fromJson(response.data);
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

class LoginGoogleRepository {
  ApiProvider apiProvider = ApiProvider();
  String mainurl = "https://system.anakutjob.com/anakut_bank/public/api/";

  Future<LoginResponModel> loginGoogle({required String token}) async {
    String url = mainurl + "login/google/verify";
    print(url);
    print(token);
    Map body = {"token": token};
    // print(object)
    var auth = 'Bearer' + base64Encode(utf8.encode('$token'));
    print(auth);

    try {
      Response response = await apiProvider.post(
          'https://system.anakutjob.com/anakut_bank/public/api/login/google/verify',
          body,
          Options(headers: <String, String>{'authorization': auth}));
      print(response.statusCode);
      print(response.data);
      if (response.statusCode == 200 && response.data["code"] == 0) {
        print(response.data);
        return LoginResponModel.fromJson(response.data);
        // return response.data["token"];
      } else if (response.data["code"].toString() != "0") {
        throw response.data["message"];
      }
      throw CustomException.generalException();
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
