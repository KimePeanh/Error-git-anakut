import 'dart:convert';

class UserModel {
  final int? id;
  final String token;
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? verifyStatus;
  final String? qrcode;
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["user"]['id'],
      token: json['token'],
      firstname: json["user"]["first_name"],
      lastname: json["user"]["last_name"],
      phone: json["user"]["phone"],
      verifyStatus: json["user"]["verify_status"],
      qrcode: json["user"]["qrcode"],
    );
  }

  UserModel({
    required this.id,
    required this.token,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.verifyStatus,
    required this.qrcode,
  });
}

class LoginResponModel {
  final String token;
  final String staus;
  factory LoginResponModel.fromJson(Map<String, dynamic> json) {
    return LoginResponModel(staus: json["user"]["verified_status"], token: json["token"]);
  }
  LoginResponModel({required this.staus, required this.token});
}
