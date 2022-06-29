

class TransctionHistoryModel {
  final int transaction_id;
  final String? sender_phone;
  final String? receiver_phone;
  final String amount;
  final String date;
  final String service_charge;
  final String wing_charge;
  final String profit;
  final String note;
  final String create_date;
  final String return_date;
  final String deleted_date;
  final CurrencytypeModel? currencytypeModel;

  factory TransctionHistoryModel.fromjson(Map<String, dynamic> json){
    return TransctionHistoryModel(
      transaction_id: json['transaction_id'],
      sender_phone: json['sender_phone'],
      receiver_phone: json['receiver_phone'],
      amount: json['amount'],
      date: json['date'],
      service_charge: json['service_charge'],
      wing_charge: json['wing_charge'],
      profit: json['profit'],
      note: json['note'],
      create_date: json['create_date'],
      return_date: json['return_date'],
      deleted_date: json['deleted_date'],
      currencytypeModel : json['currency_type'] == null? null : CurrencytypeModel.fromjson(json['currency_type'],)
    );
  }

  TransctionHistoryModel({
    required this.transaction_id,
    required this.sender_phone,
    required this.receiver_phone,
    required this.amount,
    required this.date,
    required this.service_charge,
    required this.wing_charge,
    required this.profit,
    required this.note,
    required this.create_date,
    required this.return_date,
    required this.deleted_date,
    required this.currencytypeModel
  });
}


class CurrencytypeModel {
  final int id;
  final String code;
  final String name;
  final String symbol;
  final String image;
  final String created_date;

  factory CurrencytypeModel.fromjson(Map<String, dynamic> json) {
    return CurrencytypeModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      created_date: json['created_date'],
    );
  }

  CurrencytypeModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.symbol,
      required this.image,
      required this.created_date});
}
