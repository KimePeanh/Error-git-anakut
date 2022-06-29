part of 'payment_history_bloc.dart';

abstract class PaymentHistoryState extends Equatable {
  const PaymentHistoryState();
  
  @override
  List<Object> get props => [];
}

class PaymentHistoryInitial extends PaymentHistoryState {}

class FetchingPaymentHistory extends PaymentHistoryState{}

class FetchedPaymentHistory extends PaymentHistoryState{}

class ErrorPaymentHistory extends PaymentHistoryState{
  final String e;
  ErrorPaymentHistory({required this.e});
}

class End extends PaymentHistoryState{}

class Refreshing extends PaymentHistoryState{}