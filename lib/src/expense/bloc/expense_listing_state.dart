
import 'package:equatable/equatable.dart';

abstract class ExpenseListingState extends Equatable {
  const ExpenseListingState();

  @override
  List<Object> get props => [];
}

class InitializingExpenseList extends ExpenseListingState {}

class InitializedExpenseList extends ExpenseListingState {}

class FetchingExpenseList extends ExpenseListingState {}

class FetchedExpenseList extends ExpenseListingState {}

class EndOfExpenseList extends ExpenseListingState {}

class ErrorFetchingExpenseList extends ExpenseListingState {
  final String error;
  ErrorFetchingExpenseList({required this.error});
 
}

class ErrorInitializingExpenseList extends ExpenseListingState  {
  final String error;
  ErrorInitializingExpenseList({required this.error});

}
