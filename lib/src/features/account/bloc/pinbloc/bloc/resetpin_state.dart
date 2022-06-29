part of 'resetpin_bloc.dart';

abstract class ResetpinState extends Equatable {
  const ResetpinState();

  @override
  List<Object> get props => [];
}

class ResetpinInitial extends ResetpinState {}

class Resetting extends ResetpinState {}

class Resetted extends ResetpinState {}

class ErrorReset extends ResetpinState {
  final String error;
  ErrorReset({required this.error});
}
