
class CurrencyModel {
  final int? id;
  final String? code;
  final String? name;
  final String? rate;
  final String? image;
  final String? update_at;
  final String? symbol;

  factory CurrencyModel.fromjson(Map<String, dynamic> json) {
    return CurrencyModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      rate: json['rate'],
      image: json['image'],
      update_at: json['update_at'],
      symbol: json['symbol'],
    );
  }

  CurrencyModel(
      {required this.id,
      required this.code,
      required this.name,
      required this.rate,
      required this.image,
      required this.update_at,
      required this.symbol});
}
