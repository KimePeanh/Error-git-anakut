import 'package:equatable/equatable.dart';

abstract class ExpenseListingEvent extends Equatable {
  @override
  List<Object> get props => [];
  ExpenseListingEvent();
}

class InitializeExpenseList extends ExpenseListingEvent {
  final String? dateRange;
  InitializeExpenseList({required this.dateRange});
}

class FetchExpenseList extends ExpenseListingEvent {
  final arg;
  FetchExpenseList({required this.arg});
}

class TriggerList extends ExpenseListingEvent {}
