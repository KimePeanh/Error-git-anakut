class ItemLoanModel {
  final int id;
  final String name;
  final String name_kh;

  factory ItemLoanModel.fromjson(Map<String, dynamic> json) {
    return ItemLoanModel(
        id: json['id'], name: json['name'], name_kh: json['name_kh']);
  }

  ItemLoanModel({required this.id, required this.name, required this.name_kh});
}
