class RecieptModel {
  final int? money_exchange_id;
  final String? rate;
  final String? counter_name;
  final CurrencyInModel? currencyInModel;
  final CurrencyOutModel? currencyOutModel;
  final String? amount_in;
  final String? amount_out;
  final String? create_date;

  factory RecieptModel.fromjson(Map<String, dynamic> json) {
    return RecieptModel(
      money_exchange_id: json['money_exchange_id'],
      rate: json['rate'],
      counter_name: json['counter']['name'],
      currencyInModel: json["currency_in"] == null
          ? null
          : CurrencyInModel.fromJson(json["currency_in"]),
      currencyOutModel: json["currency_out"] == null
          ? null
          : CurrencyOutModel.fromJson(json["currency_out"]),
      amount_in: json['amount_in'],
      amount_out: json['amount_out'],
      create_date: json['create_date'],
    );
  }

  RecieptModel({
    required this.money_exchange_id,
    required this.rate,
    required this.counter_name,
    required this.currencyInModel,
    required this.currencyOutModel,
    required this.amount_in,
    required this.amount_out,
    required this.create_date,
  });
}

class CurrencyInModel {
  final String id;
  final String code;
  final String name;
  final String createAt;
  factory CurrencyInModel.fromJson(Map<String, dynamic> json) {
    return CurrencyInModel(
        id: json["id"].toString(),
        code: json["code"],
        name: json["name"],
        createAt: json["created_date"]);
  }
  CurrencyInModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.createAt});
}

class CurrencyOutModel {
  final String id;
  final String code;
  final String name;
  final String createAt;
  factory CurrencyOutModel.fromJson(Map<String, dynamic> json) {
    return CurrencyOutModel(
        id: json["id"].toString(),
        code: json["code"],
        name: json["name"],
        createAt: json["created_date"]);
  }
  CurrencyOutModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.createAt});
}
