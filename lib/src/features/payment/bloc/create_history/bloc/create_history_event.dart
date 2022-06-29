part of 'create_history_bloc.dart';

abstract class CreateHistoryEvent extends Equatable {
  const CreateHistoryEvent();

  @override
  List<Object> get props => [];
}

class CreatePress extends CreateHistoryEvent {
  final String counter_id;
  final int currency_id;
  final String amount;
  final String note;

  CreatePress(
      {required this.counter_id,
      required this.currency_id,
      required this.amount,
      required this.note});
}
