part of 'setpin_bloc.dart';

abstract class SetpinEvent extends Equatable {
  const SetpinEvent();

  @override
  List<Object> get props => [];
}

class SetPinPress extends SetpinEvent {
  final String pin;
  final String otp;
  SetPinPress({required this.pin, required this.otp});
}
