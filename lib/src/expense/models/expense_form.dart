import 'expense.dart';

class ExpenseForm extends Expense {
  final String? expenseTypeId;
  ExpenseForm({
    required String amount,
    required String note,
    required String date,
    required String ref,
    required this.expenseTypeId,
  }) : super(
            expenseTypeId: null,
            id: null,
            amount: amount,
            expenseType: null,
            note: note,
            date: date,
            ref: ref,
            imageAttachment: null);
  Map<String, dynamic> toJson() {
    return this.imageAttachment == null
        ? {
            "date": this.date,
            "reference": this.ref,
            "amount": this.amount,
            "note": this.note,
            "category_id": this.expenseTypeId,
            // "created_by": "string"
          }
        : {
            "date": this.date,
            "reference": this.ref,
            "amount": this.amount,
            "note": this.note,
            "category_id": this.expenseTypeId,
            "attachment": this.imageAttachment
          };
  }
}
