part of 'transaction_cashout_bloc.dart';

abstract class TransactionCashoutState extends Equatable {
  const TransactionCashoutState();
  
  @override
  List<Object> get props => [];
}

class TransactionCashoutInitial extends TransactionCashoutState {}


class FetchingTransaction extends TransactionCashoutState {}

class FetchedTransaction extends TransactionCashoutState {}

class ErrorFetchTransaction extends TransactionCashoutState {
  final String e;
  ErrorFetchTransaction({required this.e});
}

class Refreshing extends TransactionCashoutState {}


class EndOfTransaction extends TransactionCashoutState{}

