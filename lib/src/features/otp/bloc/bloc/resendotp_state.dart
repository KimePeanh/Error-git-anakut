part of 'resendotp_bloc.dart';

abstract class ResendotpState extends Equatable {
  const ResendotpState();

  @override
  List<Object> get props => [];
}

class ResendotpInitial extends ResendotpState {}

class Resending extends ResendotpState {}

class Resentt extends ResendotpState {}

class ErrorResend extends ResendotpState {
  final String e;
  ErrorResend({required this.e});
}
