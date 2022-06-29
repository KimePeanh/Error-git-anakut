part of 'setpin_bloc.dart';

abstract class SetpinState extends Equatable {
  const SetpinState();

  @override
  List<Object> get props => [];
}

class SetpinInitial extends SetpinState {}

class SettingPin extends SetpinState {}

class SettedPin extends SetpinState {}

class ErrorSet extends SetpinState {
  final String error;
  ErrorSet({required this.error});
}
