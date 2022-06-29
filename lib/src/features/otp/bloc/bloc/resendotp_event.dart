part of 'resendotp_bloc.dart';

abstract class ResendotpEvent extends Equatable {
  const ResendotpEvent();

  @override
  List<Object> get props => [];
}

class ResendPress extends ResendotpEvent{}