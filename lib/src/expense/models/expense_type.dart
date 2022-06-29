class ExpenseType {
  final String id;
  final String? name;

  factory ExpenseType.fromJson(Map<String, dynamic> json) {
    return ExpenseType(id: json["id"].toString(), name: json["name"]);
  }
  ExpenseType({
    required this.id,
    required this.name,
  });
}
