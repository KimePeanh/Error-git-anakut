import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

enum Method {Post , Get, Delete, Put}

class ApiProvider {
  static String accessToken = '';
  Dio _dio = Dio();

  Future<Response> post (String url , dynamic body, Options? options){
    return _httpServices(
        method: Method.Post, url: url, body: body, options: options);
  }

  Future<Response> get(String url, dynamic body, Options? options) async {
    return _httpServices(
        method: Method.Get, url: url, body: null, options: options);
  }

  Future<Response> put(String url, dynamic body) async {
    return _httpServices(method: Method.Put, url: url, body: body);
  }

  Future<Response> delete(String url, dynamic body) async {
    return _httpServices(method: Method.Delete, url: url, body: body);
  }
    Future<Response> _httpServices(
      {required Method method,
      required String url,
      dynamic body,
      Options? options}) async {
    Response response;
    try {
      _dio.options.headers["authorization"] = "Bearer " + accessToken;
      response = await ((method == Method.Post)
          ? _dio.post(url, data: body)
          : (method == Method.Get)
              ? _dio.get(url, options: options)
              : (method == Method.Put)
                  ? _dio.put(url, data: body)
                  : _dio.delete(url, data: body));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return e.response!;
      }
      throw Exception("No Internet connection.");
    }
    return response;
  }
}
