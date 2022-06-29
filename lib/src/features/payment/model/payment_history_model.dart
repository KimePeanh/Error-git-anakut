
class PaymentHistoryModel{
  final int id;
  final String? transaction_type;
  final String? company_id;
  final String? sender_phone;
  final String? receiver_phone;
  final String? amount;
  final String? date;
  final String? service_charge;
  final String? wing_charge;
  final String? note;
  final String? return_date;
  final String? create_date;
  final String? deleted_date;
  // final String? code;
  // final String? name;
  // final String? symbol;
  final currencytypeModel? currencytype;


  factory PaymentHistoryModel.fromjson(Map<String, dynamic> json){
    return PaymentHistoryModel(
      id :json['transaction_id'],
      transaction_type : json['transaction_type'],
      company_id : json['company_id'],
      sender_phone : json['sender_phone'],
      receiver_phone : json['receiver_phone'],
      amount : json['amount'],
      date : json['date'],
      service_charge : json['service_charge'],
      wing_charge : json['wing_charge'],
      note: json['note'],
      return_date : json['return_date'],
      create_date : json['create_date'],
      deleted_date : json['deleted_date'],
      // code : json['currency_type']['code'].toString(),
      // name : json['currency_type']['name'].toString(),
      // symbol : json['currency_type']['symbol'].toString(),
      currencytype : json["currency_type"] == null
          ? null
          : currencytypeModel.fromjson(json["currency_type"]),
    );
  }

  PaymentHistoryModel({
    required this.id,
    required this.transaction_type,
    required this.company_id,
    required this.sender_phone,
    required this.receiver_phone,
    required this.amount,
    required this.date,
    required this.service_charge,
    required this.wing_charge,
    required this.note,
    required this.return_date,
    required this.create_date,
    required this.deleted_date,
    // required this.code,
    // required this.name,
    // required this.symbol,
    required this.currencytype
  });

}

class currencytypeModel{
  final int id;
  final String? code;
  final String? name;
  final String? symbol;

  factory currencytypeModel.fromjson(Map<String, dynamic> json){
    return currencytypeModel(
      id : json['id'],
      code : json['code'],
      name : json['name'],
      symbol : json['symbol']
    );
  }


  currencytypeModel({
    required this.id,
    required this.code,
    required this.name,
    required this.symbol
  });
}