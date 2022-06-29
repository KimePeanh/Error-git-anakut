import 'dart:developer';

class Expense {
  final String? id;
  final String? expenseType;
  final String? expenseTypeId;
  final String amount;
  final String? note;
  final String? date;
  final String? ref;
  String? imageAttachment;
  factory Expense.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return Expense(
        id: json["id"].toString(),
        expenseType: json["category_name"],
        amount: json["amount"].toString(),
        note: json["note"],
        date: json["date"],
        imageAttachment: json["attachment"],
        ref: json["reference"],
        expenseTypeId: json["category_id"].toString());
  }
  Expense(
      {required this.id,
      required this.expenseType,
      required this.expenseTypeId,
      required this.amount,
      required this.note,
      required this.date,
      required this.ref,
      required this.imageAttachment});
}

// {
//   "date": "string",
//   "reference": "string",
//   "amount": 0,
//   "note": "string",
//   "category_id": "string",
//   "created_by": "string"
// }
