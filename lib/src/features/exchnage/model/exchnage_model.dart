class ExchangeModel {
  final int? id;
  final FromModel? fromModel;
  final InModel? inModel;
  final String rate_in;
  final String rate_out;

  factory ExchangeModel.fromjson(Map<String, dynamic> json) {
    return ExchangeModel(
      id: json['id'],
      fromModel: json["from"] == null ? null : FromModel.fromjson(json["from"]),
      inModel: json["to"] == null ? null : InModel.fromjson(json["to"]),
      rate_in: json['rate_in'],
      rate_out : json['rate_out']
    );
  }

  ExchangeModel({
    required this.id,
    required this.fromModel,
    required this.inModel,
    required this.rate_in,
    required this.rate_out
  });
}

class FromModel {
  final int id;
  final String code;
  final String name;
  final String image;
  final String symbol;
  final String created_date;

  factory FromModel.fromjson(Map<String, dynamic> json) {
    return FromModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      image: json['image'],
      symbol: json['symbol'],
      created_date: json['created_date'],
    );
  }

  FromModel({
    required this.id,
    required this.code,
    required this.name,
    required this.image,
    required this.symbol,
    required this.created_date,
  });
}

class InModel {
  final int id;
  final String code;
  final String name;
  final String image;
  final String symbol;
  final String created_date;

  factory InModel.fromjson(Map<String, dynamic> json) {
    return InModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      image: json['image'],
      symbol: json['symbol'],
      created_date: json['created_date'],
    );
  }

  InModel({
    required this.id,
    required this.code,
    required this.name,
    required this.image,
    required this.symbol,
    required this.created_date,
  });
}

class ExchangeHistoryModel {
  final int money_exchange_id;
  final String? rate;
  final CurrencyInModel? currencyInModel;
  final CurrencyOutModel? currencyOutModel;
  final String? amount_in;
  final String? amount_out;
  final String? create_date;

  factory ExchangeHistoryModel.fromjson(Map<String, dynamic> json) {
    return ExchangeHistoryModel(
      money_exchange_id: json['money_exchange_id'],
      rate: json['rate'],
      currencyInModel: json["currency_in"] == null
          ? null
          : CurrencyInModel.fromJson(json["currency_in"]),
      currencyOutModel: json['currency_out'] == null
          ? null
          : CurrencyOutModel.fromjson(json['currency_out']),
      amount_in: json['amount_in'],
      amount_out: json['amount_out'],
      create_date: json['create_date'],
    );
  }

  ExchangeHistoryModel({
    required this.money_exchange_id,
    required this.rate,
    required this.currencyInModel,
    required this.currencyOutModel,
    required this.amount_in,
    required this.amount_out,
    required this.create_date,
  });
}

class CurrencyInModel {
  final int id;
  final String code;
  final String name;
  final String update_at;
  final String symbol;
  final String created_date;

  factory CurrencyInModel.fromJson(Map<String, dynamic> json) {
    return CurrencyInModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      update_at: json['update_at'],
      symbol: json['symbol'],
      created_date: json['created_date'],
    );
  }

  CurrencyInModel({
    required this.id,
    required this.code,
    required this.name,
    required this.update_at,
    required this.symbol,
    required this.created_date,
  });
}

class CurrencyOutModel {
  final int id;
  final String code;
  final String name;
  final String update_at;
  final String symbol;
  final String created_date;

  factory CurrencyOutModel.fromjson(Map<String, dynamic> json) {
    return CurrencyOutModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      update_at: json['update_at'],
      symbol: json['symbol'],
      created_date: json['created_date'],
    );
  }

  CurrencyOutModel({
    required this.id,
    required this.code,
    required this.name,
    required this.update_at,
    required this.symbol,
    required this.created_date,
  });
}
