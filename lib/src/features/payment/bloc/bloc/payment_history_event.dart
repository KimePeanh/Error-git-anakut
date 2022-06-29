part of 'payment_history_bloc.dart';

abstract class PaymentHistoryEvent extends Equatable {
  const PaymentHistoryEvent();

  @override
  List<Object> get props => [];
}


class FetchPaymentHistoryStarted extends PaymentHistoryEvent{
  
}

class RefreshHis extends PaymentHistoryEvent{}