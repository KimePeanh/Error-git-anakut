part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckingAuthenticationStarted extends AuthEvent {}

class AuthenticationStarted extends AuthEvent {
  final String token;
  final String ver;
  AuthenticationStarted({required this.token, required this.ver});
}

class LogoutPressed extends AuthEvent {}
