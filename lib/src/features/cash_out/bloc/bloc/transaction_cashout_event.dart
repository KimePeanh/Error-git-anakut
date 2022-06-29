part of 'transaction_cashout_bloc.dart';

abstract class TransactionCashoutEvent extends Equatable {
  const TransactionCashoutEvent();

  @override
  List<Object> get props => [];
}


class FetchTransactionStarted extends TransactionCashoutEvent{}

class Reload extends TransactionCashoutEvent{}