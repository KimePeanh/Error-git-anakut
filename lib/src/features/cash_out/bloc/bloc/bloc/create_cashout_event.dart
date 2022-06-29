part of 'create_cashout_bloc.dart';

abstract class CreateCashoutEvent extends Equatable {
  const CreateCashoutEvent();

  @override
  List<Object> get props => [];
}

class CreatePress extends CreateCashoutEvent {
  final int currency_id;
  final String transaction_reference;
  final String amount;
  final String sender_phone;
  final String receiver_phone;

  CreatePress(
      {required this.currency_id,
      required this.transaction_reference,
      required this.amount,
      required this.sender_phone,
      required this.receiver_phone});
}
