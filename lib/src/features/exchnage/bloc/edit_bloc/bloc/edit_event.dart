part of 'edit_bloc.dart';

abstract class EditEvent extends Equatable {
  const EditEvent();

  @override
  List<Object> get props => [];
}

class EditPress extends EditEvent {
  final int currency_in;
  final int currency_out;
  final double rate;
  final double amount_in;
  final double amount_out;
  final int id;
  EditPress({
    required this.currency_in,
    required this.currency_out,
    required this.rate,
    required this.amount_in,
    required this.amount_out,
    required this.id,
  });
}
