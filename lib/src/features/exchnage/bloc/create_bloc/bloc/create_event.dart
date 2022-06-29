part of 'create_bloc.dart';

abstract class CreateEvent extends Equatable {
  const CreateEvent();

  @override
  List<Object> get props => [];
}

class SubmitPress extends CreateEvent {
  final int counter_id;
  final double currency_in;
  final double currency_out;
  final double rate;
  final double amount_in;
  final double amount_out;
  SubmitPress(
      {required this.counter_id,
      required this.currency_in,
      required this.currency_out,
      required this.rate,
      required this.amount_in,
      required this.amount_out});
}
