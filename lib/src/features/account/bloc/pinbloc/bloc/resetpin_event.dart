part of 'resetpin_bloc.dart';

abstract class ResetpinEvent extends Equatable {
  const ResetpinEvent();

  @override
  List<Object> get props => [];
}

class ResetPressed extends ResetpinEvent {
  final String old_pin;
  final String new_pin;
  ResetPressed({required this.old_pin, required this.new_pin});
}
