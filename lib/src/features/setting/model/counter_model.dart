class CounterModel {
  final int id;
  final String? name;
  final List? counter_balance;
  // final int idc;
  // final String? namec;
  // final String? symbolc;
  // final String? amountc;

  factory CounterModel.formjson(Map<String, dynamic> json) {
    return CounterModel(
      id: json['id'],
      name: json['name'],
      counter_balance: json['counter_balance'],
      // idc: json['counter_balance']['id'],
      // namec: json['counter_balance']['name'],
      // symbolc: json['counter_balance']['symbol'],
      // amountc: json['counter_balance']['amount'],
    );
  }

  CounterModel(
      {required this.id,
      required this.name,
      required this.counter_balance,
      // required this.idc,
      // required this.namec,
      // required this.symbolc,
      // required this.amountc
      });
}

class Counter_Balance_Model {
  final int? id;
  final String? name;
  final String? symbol;
  final String? amount;

  factory Counter_Balance_Model.fromjson(Map<String, dynamic> json) {
    return Counter_Balance_Model(
      id: json['counter_balance']['id'],
      name: json['counter_balance']['name'],
      symbol: json['counter_balance']['symbol'],
      amount: json['counter_balance']['amount'],
    );
  }

  Counter_Balance_Model(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.amount});
}
