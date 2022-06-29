import 'package:flutter/foundation.dart';

class TransferModel {
  final String? home_name;
  final String? image;
  final String? address;

  factory TransferModel.fromjson(Map<String, dynamic> json) {
    return TransferModel(
      home_name: json['home_name'],
      image: json['image'],
      address: json['address'],
    );
  }

  TransferModel(
      {required this.home_name, required this.image, required this.address});
}
